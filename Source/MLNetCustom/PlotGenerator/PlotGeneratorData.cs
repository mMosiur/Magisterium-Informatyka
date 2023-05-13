using System.Globalization;
using CsvHelper;

namespace MLNetCustom;

public sealed class PlotGeneratorData
{
    private readonly List<double> _trainAccuracy;
    private readonly List<double> _trainLoss;
    private readonly List<double> _validationAccuracy;
    private readonly List<double> _validationLoss;

    public int TrainCount { get; private set; }
    public int ValidationCount { get; private set; }

    public IReadOnlyList<double> TrainAccuracy => _trainAccuracy;
    public IReadOnlyList<double> TrainLoss => _trainLoss;
    public IReadOnlyList<double> ValidationAccuracy => _validationAccuracy;
    public IReadOnlyList<double> ValidationLoss => _validationLoss;

    public PlotGeneratorData()
    {
        _trainAccuracy = new();
        _trainLoss = new();
        TrainCount = 0;
        _validationAccuracy = new();
        _validationLoss = new();
        ValidationCount = 0;
    }

    public PlotGeneratorData(int capacityPerList)
    {
        _trainAccuracy = new(capacityPerList);
        _trainLoss = new(capacityPerList);
        TrainCount = 0;
        _validationAccuracy = new(capacityPerList);
        _validationLoss = new(capacityPerList);
        ValidationCount = 0;
    }

    public void AppendTrainMetric(double accuracy, double loss)
    {
        _trainAccuracy.Add(accuracy);
        _trainLoss.Add(loss);
        TrainCount++;
    }

    public void AppendValidationMetric(double accuracy, double loss)
    {
        _validationAccuracy.Add(accuracy);
        _validationLoss.Add(loss);
        ValidationCount++;
    }

    public void SaveToCsv(string filename)
    {
        if (TrainCount != ValidationCount) throw new InvalidOperationException("Train and validation count mismatch");
        using var stream = File.OpenWrite(filename);
        using var streamWriter = new StreamWriter(stream);
        using var csvWriter = new CsvWriter(streamWriter, CultureInfo.InvariantCulture);
        csvWriter.WriteRecords(GetEpochRecords());
        csvWriter.Flush();
    }

    private IEnumerable<EpochRecord> GetEpochRecords()
    {
        if (TrainCount != ValidationCount) throw new InvalidOperationException("Train and validation count mismatch");
        int epoch = 0;
        double? trainAccuracy = epoch < _trainAccuracy.Count ? _trainAccuracy[epoch] : null;
        double? trainLoss = epoch < _trainLoss.Count ? _trainLoss[epoch] : null;
        double? validationAccuracy = epoch < _validationAccuracy.Count ? _validationAccuracy[epoch] : null;
        double? validationLoss = epoch < _validationLoss.Count ? _validationLoss[epoch] : null;
        while (trainAccuracy is not null || trainLoss is not null || validationAccuracy is not null || validationLoss is not null)
        {
            yield return new()
            {
                Epoch = epoch,
                TrainAccuracy = trainAccuracy,
                TrainLoss = trainLoss,
                ValidationAccuracy = validationAccuracy,
                ValidationLoss = validationLoss
            };
            epoch++;
            trainAccuracy = epoch < _trainAccuracy.Count ? _trainAccuracy[epoch] : null;
            trainLoss = epoch < _trainLoss.Count ? _trainLoss[epoch] : null;
            validationAccuracy = epoch < _validationAccuracy.Count ? _validationAccuracy[epoch] : null;
            validationLoss = epoch < _validationLoss.Count ? _validationLoss[epoch] : null;
        }
    }

    public static PlotGeneratorData ReadFromCsv(string filename)
    {
        using var stream = File.OpenRead(filename);
        using var streamReader = new StreamReader(stream);
        using var csvReader = new CsvReader(streamReader, CultureInfo.InvariantCulture);
        var records = csvReader.GetRecords<EpochRecord>().ToArray();
        var data = new PlotGeneratorData(records.Length);
        foreach (var record in records)
        {
            if(record.Epoch != data.TrainCount || record.Epoch != data.ValidationCount)
            {
                throw new ArgumentException($"Expected epoch {data.TrainCount} and {data.ValidationCount}, got {record.Epoch}");
            }
            data._trainAccuracy.Add(record.TrainAccuracy!.Value);
            data._trainLoss.Add(record.TrainLoss!.Value);
            data.TrainCount++;
            data._validationAccuracy.Add(record.ValidationAccuracy!.Value);
            data._validationLoss.Add(record.ValidationLoss!.Value);
            data.ValidationCount++;
        }

        return data;
    }

    private class EpochRecord
    {
        public required int Epoch { get; init; }
        public double? TrainAccuracy { get; init; }
        public double? TrainLoss { get; init; }
        public double? ValidationAccuracy { get; init; }
        public double? ValidationLoss { get; init; }
    }
}
