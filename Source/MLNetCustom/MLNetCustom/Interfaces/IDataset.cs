using Microsoft.ML;

namespace MLNetCustom.Interfaces;

public interface IDataset
{
    IDataView TrainSet { get; }
    IDataView ValidationSet { get; }
    IDataView TestSet { get; }
    DataViewSchema Schema { get; }
}
