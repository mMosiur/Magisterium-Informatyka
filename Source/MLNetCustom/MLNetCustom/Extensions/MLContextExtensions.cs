using Microsoft.ML;

namespace MLNetCustom.Extensions;

// ReSharper disable once InconsistentNaming
internal static class MLContextExtensions
{
    public static DatasetProvider CreateDatasetProvider(this MLContext context, DatasetProvider.Options options)
        => new(context, options);

    public static AlzheimerPredictionEngineTrainer CreateAlzheimerPredictionEngine(this MLContext context, DatasetProvider datasetProvider)
        => new(context, datasetProvider);
}
