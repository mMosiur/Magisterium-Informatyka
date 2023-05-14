using System.Text.Json;
using Microsoft.ML;
using Microsoft.ML.Trainers;
using Microsoft.ML.Vision;
using MLNetCustom;
using MLNetCustom.Extensions;
using Plotly.NET.ImageExport;

var mlContext = new MLContext();

var datasetProvider = mlContext.CreateDatasetProvider(new()
{
    TrainDatasetPath = @"C:\Users\mmorus\Source\UMCS\Magisterium-Informatyka\Dataset\train",
    TestDatasetPath = @"C:\Users\mmorus\Source\UMCS\Magisterium-Informatyka\Dataset\test",
    ValidationFraction = 0.2,
    AutoloadDataset = true,
});

var engine = mlContext.CreateAlzheimerPredictionEngine(datasetProvider);

// Uncomment below to generate architecture comparison data
// GenerateArchitectureComparisonData(engine);

// Uncomment below to train engine
TrainEngineForLonger(engine);

static void TrainEngineForLonger(AlzheimerPredictionEngineTrainer engine)
{
    var plotGenerator = new PlotGenerator(new PlotGeneratorData(10));
    const int epochCount = 200;
    engine.Train(new()
    {
        MetricsCallback = metrics =>
        {
            plotGenerator.Data.Add(metrics);
            Console.WriteLine($"Epoch {metrics.Train.Epoch+1}/{epochCount}, dataset {metrics.Train.DatasetUsed}");
        },
        Epoch = epochCount,
        Architecture = ImageClassificationTrainer.Architecture.ResnetV2101,
        LearningRateScheduler = new ExponentialLRDecay(0.01f, 20)
    });

    plotGenerator.Data.SaveToCsv("outputs/single/chart-metrics-log.csv");
    var chart = plotGenerator.GeneratePlot();
    chart.SavePNG("outputs/single/chart");

    var metrics = engine.Test();
    var serialized = JsonSerializer.Serialize(metrics);
    File.WriteAllText("outputs/single/test_metrics.json", serialized);
}

static void GenerateArchitectureComparisonData(AlzheimerPredictionEngineTrainer engine)
{
    var architectures = Enum.GetValues<ImageClassificationTrainer.Architecture>();
    foreach (var (architecture, index) in architectures.Select((a, i) => (a, i)))
    {
        var plotGenerator = new PlotGenerator(new PlotGeneratorData(10));
        const int epochCount = 100;
        engine.Train(new()
        {
            MetricsCallback = metrics =>
            {
                plotGenerator.Data.Add(metrics);
                Console.WriteLine($"Arch: {architecture} ({index+1}/{architectures.Length}), epoch: {metrics.Train.Epoch+1}/{epochCount}, dataset {metrics.Train.DatasetUsed}");
            },
            Epoch = epochCount,
            Architecture = architecture,
            LearningRateScheduler = new ExponentialLRDecay(0.01f, 20)
        });

        plotGenerator.Data.SaveToCsv($"outputs/comparison/chart-metrics-log-{architecture}.csv");
        var chart = plotGenerator.GeneratePlot();
        chart.SavePNG($"outputs/comparison/chart-{architecture}-train");
        Console.WriteLine($"Charts saved for architecture '{architecture}'");

        var metrics = engine.Test();
        var serialized = JsonSerializer.Serialize(metrics);
        File.WriteAllText($"outputs/comparison/test-{architecture}-metrics.json", serialized);
    }
}
