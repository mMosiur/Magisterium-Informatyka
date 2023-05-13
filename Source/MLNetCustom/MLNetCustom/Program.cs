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
// TrainEngineForLonger(engine);

static void TrainEngineForLonger(AlzheimerPredictionEngineTrainer engine)
{
    var plotGenerator = new PlotGenerator(new PlotGeneratorData(10));
    engine.Train(new()
    {
        MetricsCallback = metrics => plotGenerator.Data.Add(metrics),
        Epoch = 800,
        Architecture = ImageClassificationTrainer.Architecture.ResnetV250,
        LearningRateScheduler = new LsrDecay(0.01f)
    });

    plotGenerator.Data.SaveToCsv("chart-metrics-log.csv");
    var chart = plotGenerator.GeneratePlot();
    chart.SavePNG("chart");
}

static void GenerateArchitectureComparisonData(AlzheimerPredictionEngineTrainer engine)
{
    foreach (var architecture in Enum.GetValues<ImageClassificationTrainer.Architecture>())
    {
        var plotGenerator = new PlotGenerator(new PlotGeneratorData(10));
        engine.Train(new()
        {
            MetricsCallback = metrics => plotGenerator.Data.Add(metrics),
            Epoch = 200,
            Architecture = architecture
        });

        plotGenerator.Data.SaveToCsv($"chart-metrics-log-{architecture}.csv");
        var chart = plotGenerator.GeneratePlot();
        chart.SavePNG($"chart-{architecture}-train");
        Console.WriteLine($"Charts saved for architecture '{architecture}'");
    }
}
