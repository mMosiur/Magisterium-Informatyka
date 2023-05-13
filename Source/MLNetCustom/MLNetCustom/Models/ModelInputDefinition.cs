namespace MLNetCustom.Models;

internal abstract class ModelInputDefinition
{
    public required byte[] Image { get; init; }

    public required uint LabelAsKey { get; init; }

    public required string ImagePath { get; init; }

    public required string Label { get; init; }
}
