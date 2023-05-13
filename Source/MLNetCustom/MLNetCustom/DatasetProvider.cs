using Microsoft.ML;
using MLNetCustom.Interfaces;
using MLNetCustom.Models;

namespace MLNetCustom;

internal sealed class DatasetProvider : IDataset
{
    private readonly MLContext _context;
    private Options _options;

    private IDataView? _trainSet;
    private IDataView? _validationSet;
    private IDataView? _testSet;
    private DataViewSchema? _schema;

    public IDataView TrainSet => _trainSet ?? throw new InvalidOperationException("No data has been loaded");
    public IDataView ValidationSet => _validationSet ?? throw new InvalidOperationException("No data has been loaded");
    public IDataView TestSet => _testSet ?? throw new InvalidOperationException("No data has been loaded");
    public DataViewSchema Schema => _schema ?? throw new InvalidOperationException("No data has been loaded");

    public bool IsDatasetLoaded => _trainSet is not null || _validationSet is not null || _testSet is not null;

    public DatasetProvider(MLContext context, Options options)
    {
        _context = context;
        _options = options;
        if (_options.AutoloadDataset)
        {
            LoadDataset();
        }
    }

    public void LoadDataset(string pathToTrainDataset, string pathToTestDataset)
    {
        _options = _options with
        {
            TrainDatasetPath = pathToTrainDataset,
            TestDatasetPath = pathToTestDataset
        };
        LoadDataset();
    }

    public void LoadDataset(Options options)
    {
        _options = options;
        LoadDataset();
    }

    public void LoadDataset()
    {
        var trainSet = LoadImagesFromDirectory(_options.TrainDatasetPath, out var schema);
        var trainValidationSplit = _context.Data.TrainTestSplit(trainSet, _options.ValidationFraction, seed: _options.Seed);
        _trainSet = trainValidationSplit.TrainSet;
        _validationSet = trainValidationSplit.TestSet;
        _testSet = LoadImagesFromDirectory(_options.TestDatasetPath, out _);
        _schema = schema;
    }

    private IDataView LoadImagesFromDirectory(string directory, out DataViewSchema schema)
    {
        var imagesMetadata = Directory
            .GetDirectories(directory)
            .Select(subdirectory => new { Path = subdirectory, Label = Path.GetFileName(subdirectory)! })
            .SelectMany(
                collectionSelector: dir => Directory.GetFiles(dir.Path),
                resultSelector: (dir, file) => new ImageMetadata { ImagePath = file, Label = dir.Label }
            );
        var imagesDataset = _context.Data.LoadFromEnumerable(imagesMetadata);
        schema = imagesDataset.Schema;
        imagesDataset = _context.Data.ShuffleRows(imagesDataset, _options.Seed);

        var preprocessingPipeline = _context.Transforms.Conversion.MapValueToKey(
                inputColumnName: nameof(ModelInputDefinition.Label),
                outputColumnName: nameof(ModelInputDefinition.LabelAsKey))
            .Append(_context.Transforms.LoadRawImageBytes(
                outputColumnName: nameof(ModelInputDefinition.Image),
                imageFolder: directory,
                inputColumnName: nameof(ModelInputDefinition.ImagePath)));

        return preprocessingPipeline
            .Fit(imagesDataset)
            .Transform(imagesDataset);
    }

    public sealed record Options
    {
        public int? Seed { get; init; } = null;
        public double ValidationFraction { get; init; } = 0.2D;
        public bool AutoloadDataset { get; init; } = false;

        public required string TrainDatasetPath { get; init; }
        public required string TestDatasetPath { get; init; }
    }
}
