import matplotlib.pyplot as plt
import pandas as pd

# Load the CSV datasets
mlnet_custom_results = pd.read_csv('../../Source/MLNetCustom/Resources/single/chart-metrics-log.csv')
mlnet_model_builder_results = pd.read_csv('../../Source/VisualStudioModelBuilder/Logs/training-info.csv')
tensorflownet_results = pd.read_csv('../../Source/TensorflowNet/TensorflowNet/results/training-metrics.csv')

def get_best_results_for(dataset):
    # Get the best epoch based on accuracy
    best_epoch = dataset.loc[dataset['ValidationAccuracy'].idxmax()]
    # Print values
    print(f'Best epoch: {best_epoch["Epoch"]}')
    for feature in ['TrainAccuracy', 'TrainLoss', 'ValidationAccuracy', 'ValidationLoss']:
        # Print values up to 7 decimal places
        print(f'{feature}: {best_epoch[feature]:.7f}')

def generate_comparison_plots_for(dataset1, dataset1_label, dataset1_color, dataset2, dataset2_label, dataset2_color, plot_filename, add_vertical_line = False):
    # Create a figure with two subplots
    plt.figure(figsize=(12, 5))

    # Subplot 1: Training Accuracy
    plt.subplot(1, 2, 1)
    plt.plot(dataset1['Epoch'], dataset1['TrainAccuracy'], label=dataset1_label, color=dataset1_color)
    plt.plot(dataset2['Epoch'], dataset2['TrainAccuracy'], label=dataset2_label, color=dataset2_color)
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
    plt.plot(dataset1['Epoch'], dataset1['ValidationAccuracy'], label=dataset1_label, color=dataset1_color)
    plt.plot(dataset2['Epoch'], dataset2['ValidationAccuracy'], label=dataset2_label, color=dataset2_color)
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

def generate_overview_plot_for(dataset, dataset_label, plot_filename):
    # Create a single figure with two plots and each plot having two lines
    # Each plot is either accuracy or loss and each line is either training or validation

    plt.figure(figsize=(12, 5))

    # Subplot 1: Accuracy
    plt.subplot(1, 2, 1)
    plt.plot(dataset['Epoch'], dataset['TrainAccuracy'], label=f'{dataset_label} - trening', color='#663c00')
    plt.plot(dataset['Epoch'], dataset['ValidationAccuracy'], label=f'{dataset_label} - walidacja', color='#a099ff')
    plt.xlabel('Epoka')
    plt.ylabel('Dokładność')
    plt.title('Dokładność (accuracy)')
    plt.legend()

    # Subplot 2: Loss
    plt.subplot(1, 2, 2)
    plt.plot(dataset['Epoch'], dataset['TrainLoss'], label=f'{dataset_label} - trening', color='#663c00')
    plt.plot(dataset['Epoch'], dataset['ValidationLoss'], label=f'{dataset_label} - walidacja', color='#a099ff')
    plt.xlabel('Epoka')
    plt.ylabel('Strata')
    plt.title('Strata (loss)')
    plt.legend()

    # Add whole figure title
    plt.suptitle(dataset_label)

    # Adjust layout for better appearance
    plt.tight_layout()

    plt.savefig(plot_filename)


print('ML.NET Custom')
get_best_results_for(mlnet_custom_results)
print('ML.NET Model Builder')
get_best_results_for(mlnet_model_builder_results)
print('Tensorflow.Net')
get_best_results_for(tensorflownet_results)

generate_comparison_plots_for(
    mlnet_custom_results, 'ML.NET Custom', '#662900',
    mlnet_model_builder_results, 'ML.NET Model Builder', '#1f77b4',
    'vs_mlnet_custom_vs_mlnet_model_builder.pdf', add_vertical_line = True)

generate_comparison_plots_for(
    mlnet_model_builder_results, 'ML.NET Model Builder', '#1f77b4',
    tensorflownet_results, 'Tensorflow.Net', '#b4ff99',
    'mlnet_model_builder_vs_tensorflownet.pdf', add_vertical_line = False)

generate_overview_plot_for(
    mlnet_custom_results, 'ML.NET Custom',
    'mlnet_custom_overview.pdf'
)

generate_overview_plot_for(
    mlnet_model_builder_results, 'ML.NET Model Builder',
    'mlnet_model_builder_overview.pdf'
)

generate_overview_plot_for(
    tensorflownet_results, 'Tensorflow.Net',
    'tensorflownet_overview.pdf'
)
