using Plotly.NET;

namespace MLNetCustom;

public class PlotGenerator
{
    public PlotGeneratorData Data { get; }

    public PlotGenerator() : this(new())
    {
    }

    public PlotGenerator(PlotGeneratorData data)
    {
        Data = data;
    }

    public GenericChart.GenericChart GeneratePlot(bool includeTrainData = true, bool includeValidationData = true)
    {
        if (Data.TrainCount != Data.ValidationCount)
        {
            throw new InvalidOperationException("Train and validation count must be equal");
        }
        double[] xData = Enumerable.Range(0, Data.TrainCount).Select(i => (double)i).ToArray();
        return (includeTrainData, includeValidationData) switch
        {
            (false, false) => throw new ArgumentException("At least one of includeTrainData and includeValidationData must be true"),
            (true, false) => Plot.GenerateSingleMetricsChart(
                x: xData,
                y_accuracy: Data.TrainAccuracy,
                y_loss: Data.TrainLoss),
            (false, true) => Plot.GenerateSingleMetricsChart(
                x: xData,
                y_accuracy: Data.ValidationAccuracy,
                y_loss: Data.ValidationLoss),
            (true, true) => Plot.GenerateDoubleMetricsChart(
                x: xData,
                y_train_accuracy: Data.TrainAccuracy,
                y_train_loss: Data.TrainLoss,
                y_validation_accuracy: Data.ValidationAccuracy,
                y_validation_loss: Data.ValidationLoss)
        };
    }
}
