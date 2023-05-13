using System.Diagnostics;
using Microsoft.ML.Vision;

namespace MLNetCustom.Extensions;

public static class PlotGeneratorExtensions
{
    public static void Add(this PlotGeneratorData data, ImageClassificationTrainer.ImageClassificationMetrics metrics)
    {
        switch (metrics.Train.DatasetUsed)
        {
            case ImageClassificationTrainer.ImageClassificationMetrics.Dataset.Train:
                data.AddTrain(metrics.Train);
                break;
            case ImageClassificationTrainer.ImageClassificationMetrics.Dataset.Validation:
                data.AddValidation(metrics.Train);
                break;
            default:
                throw new UnreachableException("Unknown dataset type");
        }
    }

    private static void AddTrain(this PlotGeneratorData data, ImageClassificationTrainer.TrainMetrics trainMetrics)
    {
        if (trainMetrics.Epoch != data.TrainCount)
        {
            throw new ArgumentException($"Expected train epoch {data.TrainCount}, got {trainMetrics.Epoch}", nameof(trainMetrics));
        }
        data.AppendTrainMetric(trainMetrics.Accuracy, trainMetrics.CrossEntropy);
    }

    private static void AddValidation(this PlotGeneratorData data, ImageClassificationTrainer.TrainMetrics validationMetrics)
    {
        if (validationMetrics.Epoch != data.ValidationCount)
        {
            throw new ArgumentException($"Expected validation epoch {data.ValidationCount}, got {validationMetrics.Epoch}");
        }
        data.AppendValidationMetric(validationMetrics.Accuracy, validationMetrics.CrossEntropy);
    }
}
