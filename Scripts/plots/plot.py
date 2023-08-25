import matplotlib.pyplot as plt
import pandas as pd

# Load the CSV datasets
mlnet_model_builder_results = pd.read_csv('../../Source/VisualStudioModelBuilder/Logs/training-info.csv')
mlnet_custom_results = pd.read_csv('../../Source/MLNetCustom/Resources/single/chart-metrics-log.csv')
tensorflownet_results = pd.read_csv('../../Source/TensorflowNet/TensorflowNet/results/training-metrics.csv')

def generate_plots_for(dataset1, dataset1_label, dataset2, dataset2_label, plot_filename, add_vertical_line = False):
    # Create a figure with two subplots
    plt.figure(figsize=(12, 5))

    # Subplot 1: Training Accuracy
    plt.subplot(1, 2, 1)
    plt.plot(dataset1['Epoch'], dataset1['TrainAccuracy'], label=dataset1_label)
    plt.plot(dataset2['Epoch'], dataset2['TrainAccuracy'], label=dataset2_label)
    plt.xlabel('Epoka')
    plt.ylabel('Dokładność')
    plt.title('Dokładność na zbiorze treningowym')
    plt.legend()

    if add_vertical_line:
        # Add a vertical line where the first dataset ends
        x_max = min(max(dataset1['Epoch']), max(dataset2['Epoch']))
        plt.axvline(x=x_max, color='gray', linestyle='--')

    # Subplot 2: Validation Accuracy
    plt.subplot(1, 2, 2)
    plt.plot(dataset1['Epoch'], dataset1['ValidationAccuracy'], label=dataset1_label)
    plt.plot(dataset2['Epoch'], dataset2['ValidationAccuracy'], label=dataset2_label)
    plt.xlabel('Epoka')
    plt.ylabel('Dokładność')
    plt.title('Dokładność na zbiorze walidacyjnym')
    plt.legend()

    if add_vertical_line:
        # Add a vertical line where the first dataset ends
        x_max = min(max(dataset1['Epoch']), max(dataset2['Epoch']))
        plt.axvline(x=x_max, color='gray', linestyle='--')

    plt.tight_layout()

    # Adjust layout for better appearance
    plt.savefig(plot_filename)


generate_plots_for(
    mlnet_model_builder_results, 'ML.NET Model Builder',
    mlnet_custom_results, 'ML.NET Custom',
    'plot.pdf', add_vertical_line = True)

mlnet_custom_results_first_100_epochs = mlnet_custom_results[mlnet_custom_results['Epoch'] <= 100]
generate_plots_for(
    mlnet_custom_results_first_100_epochs, 'ML.NET Custom (pierwsze 100 epok)',
    tensorflownet_results, 'Tensorflow.Net',
    'plot_tf.pdf', add_vertical_line = False)
