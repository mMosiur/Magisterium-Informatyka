using System.Text.Json;
using MLModel_Test;

const string datasetPath = "C:/Users/mmorus/Source/UMCS/Magisterium-Informatyka/Dataset/test";

var predictions = new List<(MLModel.ModelInput Input, MLModel.ModelOutput Output)>();

var labelSubsetDirectories = Directory.GetDirectories(datasetPath);
foreach (var labelSubsetPath in labelSubsetDirectories)
{
    var label = Path.GetFileName(labelSubsetPath);
    var imageFilePaths = Directory.GetFiles(labelSubsetPath);
    var index = 0;
    var imageCount = imageFilePaths.Length;
    foreach (var filePath in imageFilePaths)
    {
        var modelInput = new MLModel.ModelInput
        {
            ImageSource = File.ReadAllBytes(filePath),
            Label = label
        };
        var modelOutput = MLModel.Predict(modelInput);
        predictions.Add((modelInput, modelOutput));
        ++index;
        Console.Write($"Label '{label}', predicted: {index}/{imageCount}            \r");
    }
    Console.WriteLine();
}

var correctPredictions = predictions.Count(p => p.Input.Label == p.Output.PredictedLabel);
var accuracy = (double)correctPredictions / predictions.Count;
Console.WriteLine($"Accuracy: {accuracy}");
File.WriteAllText("outputs/metrics.json", JsonSerializer.Serialize(new { accuracy = accuracy }));
