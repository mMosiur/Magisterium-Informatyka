using System.Globalization;
using System.Text.Json;
using CsvHelper;
using CsvHelper.Configuration;
using static Tensorflow.Binding;
using static Tensorflow.KerasApi;
using Tensorflow;
using Tensorflow.Keras;
using Tensorflow.Keras.Callbacks;
using Tensorflow.Keras.Engine;

var AUTOTUNE = tf.data.AUTOTUNE;
var IMAGE_SIZE = (176, 208);
var EPOCHS = 100;
var BATCH_SIZE = 16;

var class_names = new[] { "MildDemented", "ModerateDemented", "NonDemented", "VeryMildDemented" };

foreach (var gpu in tf.config.list_physical_devices("GPU"))
{
    tf.config.experimental.set_memory_growth(gpu, true);
}

var train_ds = keras.preprocessing.image_dataset_from_directory(
    directory: @"C:\Users\mmorus\Source\UMCS\Magisterium-Informatyka\Dataset\train",
    validation_split: 0.2f,
    subset: "training",
    class_names: class_names,
    seed: 1213,
    image_size: IMAGE_SIZE,
    batch_size: BATCH_SIZE
);
var val_ds = keras.preprocessing.image_dataset_from_directory(
    directory: @"C:\Users\mmorus\Source\UMCS\Magisterium-Informatyka\Dataset\train",
    validation_split: 0.2f,
    subset: "validation",
    class_names: class_names,
    seed: 1213,
    image_size: IMAGE_SIZE,
    batch_size: BATCH_SIZE
);

var NUM_CLASSES = class_names.Length;

var one_hot_label = (Tensors tensors) =>
{
    if (tensors.Length != 2) throw new ArgumentException("Tensors must have length of 2");
    var image = tensors[0];
    var label = tensors[1];
    label = tf.one_hot(label, NUM_CLASSES);
    return new Tensors(image, label);
};

train_ds = train_ds.map(one_hot_label, num_parallel_calls: AUTOTUNE);
val_ds = val_ds.map(one_hot_label, num_parallel_calls: AUTOTUNE);

train_ds = train_ds.shuffle(100).cache().prefetch(buffer_size: AUTOTUNE);
val_ds = val_ds.cache().prefetch(buffer_size: AUTOTUNE);

Func<Model> build_model = () =>
{
    IEnumerable<ILayer> ConvBlock(int filters)
    {
        yield return keras.layers.Conv2D(filters, 3, activation: "relu", padding: "same");
        yield return keras.layers.Conv2D(filters, 3, activation: "relu", padding: "same");
        yield return keras.layers.BatchNormalization();
        yield return keras.layers.MaxPooling2D();
    }

    IEnumerable<ILayer> DenseBlock(int units, float dropout_rate)
    {
        yield return keras.layers.Dense(units, activation: "relu");
        yield return keras.layers.BatchNormalization();
        yield return keras.layers.Dropout(dropout_rate);
    }

    var layers = new List<ILayer>();
    layers.Add(keras.layers.Rescaling(1.0f / 255, input_shape: (IMAGE_SIZE.Item1, IMAGE_SIZE.Item2, 3)));
    layers.Add(keras.layers.Conv2D(8, 3, activation: "relu", padding: "same"));
    layers.Add(keras.layers.Conv2D(8, 3, activation: "relu", padding: "same"));
    layers.Add(keras.layers.MaxPooling2D());
    layers.AddRange(ConvBlock(16));
    layers.AddRange(ConvBlock(32));
    layers.AddRange(ConvBlock(64));
    layers.Add(keras.layers.Dropout(0.2f));
    layers.AddRange(ConvBlock(128));
    layers.Add(keras.layers.Dropout(0.2f));
    layers.Add(keras.layers.Flatten());
    layers.AddRange(DenseBlock(256, 0.7f));
    layers.AddRange(DenseBlock(64, 0.5f));
    layers.AddRange(DenseBlock(32, 0.3f));
    layers.Add(keras.layers.Dense(16, activation: "relu"));
    layers.Add(keras.layers.Dense(NUM_CLASSES, activation: "softmax"));
    return keras.Sequential(layers);
};

var model = build_model();

model.compile(
    loss: keras.losses.CategoricalCrossentropy(from_logits: true),
    optimizer: keras.optimizers.Adam(),
    metrics: new[] { "acc" } // should be "auc" ROC AUC probably but it is missing from the Tensorflow.NET library
);

model.summary();

var history = model.fit(
    dataset: train_ds,
    validation_data: val_ds,
    epochs: EPOCHS
);

model.save("trained-alzheimer-model.h5");

File.WriteAllText("training-metrics.json", JsonSerializer.Serialize(history.history));

using (var stream = File.OpenWrite("training-metrics.csv"))
{
    using var streamWriter = new StreamWriter(stream);
    using var csvWriter = new CsvWriter(streamWriter, new CsvConfiguration(CultureInfo.InvariantCulture)
    {
        NewLine = "\n",
    });
    csvWriter.WriteRecords(RecordsFromHistory(history.history));
    csvWriter.Flush();
}

Console.WriteLine("Finished training");

var test_ds = keras.preprocessing.image_dataset_from_directory(
    directory: @"C:\Users\mmorus\Source\UMCS\Magisterium-Informatyka\Dataset\test",
    image_size: IMAGE_SIZE,
    batch_size: BATCH_SIZE
);

test_ds = test_ds.map(one_hot_label, num_parallel_calls: AUTOTUNE);
test_ds = test_ds.cache().prefetch(buffer_size: AUTOTUNE);

var test_evaluation = model.evaluate(test_ds);

File.WriteAllText("test-evaluation.json", JsonSerializer.Serialize(test_evaluation));

Console.WriteLine("Finished test evaluation");

static IEnumerable<EpochRecord> RecordsFromHistory(IReadOnlyDictionary<string, List<float>> history)
{
    if (history.Count != 4)
    {
        throw new Exception("History should have 4 values");
    }

    var trainAccuracy = history["accuracy"];
    var trainLoss = history["loss"];
    var validationAccuracy = history["val_accuracy"];
    var validationLoss = history["val_loss"];
    if (trainAccuracy.Count != trainLoss.Count || trainAccuracy.Count != validationAccuracy.Count || trainAccuracy.Count != validationLoss.Count)
    {
        throw new Exception("History values should have the same length");
    }

    for (var i = 0; i < trainAccuracy.Count; i++)
    {
        yield return new EpochRecord
        {
            Epoch = i + 1,
            TrainAccuracy = trainAccuracy[i],
            TrainLoss = trainLoss[i],
            ValidationAccuracy = validationAccuracy[i],
            ValidationLoss = validationLoss[i],
        };
    }
}

public class EpochRecord
{
    public required int Epoch { get; init; }
    public double? TrainAccuracy { get; init; }
    public double? TrainLoss { get; init; }
    public double? ValidationAccuracy { get; init; }
    public double? ValidationLoss { get; init; }
}
