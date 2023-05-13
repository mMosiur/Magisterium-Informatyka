using System.Text.Json;
using Microsoft.ML;
using Microsoft.ML.Trainers;
using Microsoft.ML.Vision;
using MLNetCustom.Interfaces;
using MLNetCustom.Models;

namespace MLNetCustom;

internal sealed class AlzheimerPredictionEngineTrainer
{
    private readonly MLContext _context;
    private readonly DatasetProvider _datasetProvider;

    private ITransformer? _model;


    public IDataset Data => _datasetProvider;
    public ITransformer Model => _model ?? throw new InvalidOperationException("Model has not been trained yet");
    public bool IsTrained => _model is not null;

    public AlzheimerPredictionEngineTrainer(MLContext context, DatasetProvider datasetProvider)
    {
        _context = context;
        _datasetProvider = datasetProvider;
    }

    public void Train(Options? options = null)
    {
        options ??= new();

        if (!_datasetProvider.IsDatasetLoaded)
        {
            _datasetProvider.LoadDataset();
        }

        var classifierOptions = new ImageClassificationTrainer.Options
        {
            FeatureColumnName = nameof(ModelInputDefinition.Image),
            LabelColumnName = nameof(ModelInputDefinition.LabelAsKey),
            ValidationSet = _datasetProvider.ValidationSet,
            ReuseTrainSetBottleneckCachedValues = true,
            ReuseValidationSetBottleneckCachedValues = true,
            WorkspacePath = "."
        };
        classifierOptions.BatchSize = options.BatchSize ?? classifierOptions.BatchSize;
        classifierOptions.Epoch = options.Epoch ?? classifierOptions.Epoch;
        classifierOptions.LearningRate = options.LearningRate ?? classifierOptions.LearningRate;
        classifierOptions.EarlyStoppingCriteria = options.EarlyStoppingCriteria ?? classifierOptions.EarlyStoppingCriteria;
        classifierOptions.Arch = options.Architecture ?? classifierOptions.Arch;
        classifierOptions.MetricsCallback = options.MetricsCallback ?? classifierOptions.MetricsCallback;
        classifierOptions.TestOnTrainSet = options.TestOnTrainSet ?? classifierOptions.TestOnTrainSet;
        classifierOptions.LearningRateScheduler = options.LearningRateScheduler ?? classifierOptions.LearningRateScheduler;
        classifierOptions.EarlyStoppingCriteria = new ImageClassificationTrainer.EarlyStopping(patience: classifierOptions.Epoch);

        var trainingPipeline = _context.MulticlassClassification.Trainers.ImageClassification(classifierOptions)
            .Append(_context.Transforms.Conversion.MapKeyToValue(classifierOptions.PredictedLabelColumnName));

        _model = trainingPipeline.Fit(_datasetProvider.TrainSet);
    }

    public void Test()
    {
        if (!_datasetProvider.IsDatasetLoaded)
        {
            _datasetProvider.LoadDataset();
        }

        if (!IsTrained)
        {
            throw new InvalidOperationException("Model has not been trained yet");
        }

        var resultSet = Model.Transform(_datasetProvider.TestSet);
        var metrics = _context.MulticlassClassification.Evaluate(resultSet, nameof(ModelInputDefinition.LabelAsKey));
        var serializedMetrics = JsonSerializer.Serialize(metrics);
        Console.WriteLine(serializedMetrics);
    }

    public sealed record Options
    {
        public int? BatchSize { get; init; }
        public int? Epoch { get; init; }
        public float? LearningRate { get; init; }
        public ImageClassificationTrainer.EarlyStopping? EarlyStoppingCriteria { get; init; }
        public ImageClassificationTrainer.Architecture? Architecture { get; init; }
        public Action<ImageClassificationTrainer.ImageClassificationMetrics>? MetricsCallback { get; init; }
        public bool? TestOnTrainSet { get; init; }
        public LearningRateScheduler? LearningRateScheduler { get; init; }
    }
}
