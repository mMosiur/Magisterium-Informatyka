
£ˆroot"_tf_keras_layer*Çˆ{
  "name": "sequential",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "Sequential",
  "config": {
    "name": "sequential",
    "layers": [
      {
        "name": "input_1",
        "class_name": "InputLayer",
        "config": {
          "sparse": false,
          "ragged": false,
          "name": "input_1",
          "dtype": "float32",
          "batch_input_shape": {
            "class_name": "TensorShape",
            "items": [
              null,
              176,
              208,
              3
            ]
          }
        },
        "inbound_nodes": []
      },
      {
        "name": "conv2d",
        "class_name": "Conv2D",
        "config": {
          "filters": 8,
          "kernel_size": {
            "class_name": "__tuple__",
            "items": [
              3,
              3
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "padding": "same",
          "data_format": "channels_last",
          "dilation_rate": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "groups": 1,
          "activation": "relu",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "input_1",
            0,
            0
          ]
        ]
      },
      {
        "name": "conv2d_1",
        "class_name": "Conv2D",
        "config": {
          "filters": 8,
          "kernel_size": {
            "class_name": "__tuple__",
            "items": [
              3,
              3
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "padding": "same",
          "data_format": "channels_last",
          "dilation_rate": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "groups": 1,
          "activation": "relu",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "conv2d",
            0,
            0
          ]
        ]
      },
      {
        "name": "max_pooling2d",
        "class_name": "MaxPooling2D",
        "config": {
          "pool_size": {
            "class_name": "__tuple__",
            "items": [
              2,
              2
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              2,
              2
            ]
          },
          "padding": "valid",
          "data_format": "channels_last",
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "conv2d_1",
            0,
            0
          ]
        ]
      },
      {
        "name": "conv2d_2",
        "class_name": "Conv2D",
        "config": {
          "filters": 32,
          "kernel_size": {
            "class_name": "__tuple__",
            "items": [
              3,
              3
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "padding": "same",
          "data_format": "channels_last",
          "dilation_rate": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "groups": 1,
          "activation": "relu",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "max_pooling2d",
            0,
            0
          ]
        ]
      },
      {
        "name": "conv2d_3",
        "class_name": "Conv2D",
        "config": {
          "filters": 32,
          "kernel_size": {
            "class_name": "__tuple__",
            "items": [
              3,
              3
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "padding": "same",
          "data_format": "channels_last",
          "dilation_rate": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "groups": 1,
          "activation": "relu",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "conv2d_2",
            0,
            0
          ]
        ]
      },
      {
        "name": "batch_normalization",
        "class_name": "BatchNormalization",
        "config": {
          "axis": {
            "class_name": "__tuple__",
            "items": [
              3
            ]
          },
          "momentum": 0.99,
          "epsilon": 0.001,
          "center": true,
          "scale": true,
          "beta_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "gamma_initializer": {
            "class_name": "Ones",
            "config": {}
          },
          "moving_mean_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "moving_variance_initializer": {
            "class_name": "Ones",
            "config": {}
          },
          "beta_regularizer": null,
          "gamma_regularizer": null,
          "renorm": false,
          "renorm_momentum": 0.99,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "conv2d_3",
            0,
            0
          ]
        ]
      },
      {
        "name": "max_pooling2d_1",
        "class_name": "MaxPooling2D",
        "config": {
          "pool_size": {
            "class_name": "__tuple__",
            "items": [
              2,
              2
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              2,
              2
            ]
          },
          "padding": "valid",
          "data_format": "channels_last",
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "batch_normalization",
            0,
            0
          ]
        ]
      },
      {
        "name": "conv2d_4",
        "class_name": "Conv2D",
        "config": {
          "filters": 64,
          "kernel_size": {
            "class_name": "__tuple__",
            "items": [
              3,
              3
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "padding": "same",
          "data_format": "channels_last",
          "dilation_rate": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "groups": 1,
          "activation": "relu",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "max_pooling2d_1",
            0,
            0
          ]
        ]
      },
      {
        "name": "conv2d_5",
        "class_name": "Conv2D",
        "config": {
          "filters": 64,
          "kernel_size": {
            "class_name": "__tuple__",
            "items": [
              3,
              3
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "padding": "same",
          "data_format": "channels_last",
          "dilation_rate": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "groups": 1,
          "activation": "relu",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "conv2d_4",
            0,
            0
          ]
        ]
      },
      {
        "name": "batch_normalization_1",
        "class_name": "BatchNormalization",
        "config": {
          "axis": {
            "class_name": "__tuple__",
            "items": [
              3
            ]
          },
          "momentum": 0.99,
          "epsilon": 0.001,
          "center": true,
          "scale": true,
          "beta_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "gamma_initializer": {
            "class_name": "Ones",
            "config": {}
          },
          "moving_mean_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "moving_variance_initializer": {
            "class_name": "Ones",
            "config": {}
          },
          "beta_regularizer": null,
          "gamma_regularizer": null,
          "renorm": false,
          "renorm_momentum": 0.99,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "conv2d_5",
            0,
            0
          ]
        ]
      },
      {
        "name": "max_pooling2d_2",
        "class_name": "MaxPooling2D",
        "config": {
          "pool_size": {
            "class_name": "__tuple__",
            "items": [
              2,
              2
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              2,
              2
            ]
          },
          "padding": "valid",
          "data_format": "channels_last",
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "batch_normalization_1",
            0,
            0
          ]
        ]
      },
      {
        "name": "dropout",
        "class_name": "Dropout",
        "config": {
          "rate": 0.2,
          "noise_shape": null,
          "seed": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "max_pooling2d_2",
            0,
            0
          ]
        ]
      },
      {
        "name": "conv2d_6",
        "class_name": "Conv2D",
        "config": {
          "filters": 128,
          "kernel_size": {
            "class_name": "__tuple__",
            "items": [
              3,
              3
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "padding": "same",
          "data_format": "channels_last",
          "dilation_rate": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "groups": 1,
          "activation": "relu",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "dropout",
            0,
            0
          ]
        ]
      },
      {
        "name": "conv2d_7",
        "class_name": "Conv2D",
        "config": {
          "filters": 128,
          "kernel_size": {
            "class_name": "__tuple__",
            "items": [
              3,
              3
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "padding": "same",
          "data_format": "channels_last",
          "dilation_rate": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "groups": 1,
          "activation": "relu",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "conv2d_6",
            0,
            0
          ]
        ]
      },
      {
        "name": "batch_normalization_2",
        "class_name": "BatchNormalization",
        "config": {
          "axis": {
            "class_name": "__tuple__",
            "items": [
              3
            ]
          },
          "momentum": 0.99,
          "epsilon": 0.001,
          "center": true,
          "scale": true,
          "beta_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "gamma_initializer": {
            "class_name": "Ones",
            "config": {}
          },
          "moving_mean_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "moving_variance_initializer": {
            "class_name": "Ones",
            "config": {}
          },
          "beta_regularizer": null,
          "gamma_regularizer": null,
          "renorm": false,
          "renorm_momentum": 0.99,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "conv2d_7",
            0,
            0
          ]
        ]
      },
      {
        "name": "max_pooling2d_3",
        "class_name": "MaxPooling2D",
        "config": {
          "pool_size": {
            "class_name": "__tuple__",
            "items": [
              2,
              2
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              2,
              2
            ]
          },
          "padding": "valid",
          "data_format": "channels_last",
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "batch_normalization_2",
            0,
            0
          ]
        ]
      },
      {
        "name": "dropout_1",
        "class_name": "Dropout",
        "config": {
          "rate": 0.2,
          "noise_shape": null,
          "seed": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "max_pooling2d_3",
            0,
            0
          ]
        ]
      },
      {
        "name": "flatten",
        "class_name": "Flatten",
        "config": {
          "data_format": "channels_last",
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "dropout_1",
            0,
            0
          ]
        ]
      },
      {
        "name": "dense",
        "class_name": "Dense",
        "config": {
          "units": 256,
          "activation": "relu",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "flatten",
            0,
            0
          ]
        ]
      },
      {
        "name": "batch_normalization_3",
        "class_name": "BatchNormalization",
        "config": {
          "axis": {
            "class_name": "__tuple__",
            "items": [
              1
            ]
          },
          "momentum": 0.99,
          "epsilon": 0.001,
          "center": true,
          "scale": true,
          "beta_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "gamma_initializer": {
            "class_name": "Ones",
            "config": {}
          },
          "moving_mean_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "moving_variance_initializer": {
            "class_name": "Ones",
            "config": {}
          },
          "beta_regularizer": null,
          "gamma_regularizer": null,
          "renorm": false,
          "renorm_momentum": 0.99,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "dense",
            0,
            0
          ]
        ]
      },
      {
        "name": "dropout_2",
        "class_name": "Dropout",
        "config": {
          "rate": 0.7,
          "noise_shape": null,
          "seed": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "batch_normalization_3",
            0,
            0
          ]
        ]
      },
      {
        "name": "dense_1",
        "class_name": "Dense",
        "config": {
          "units": 128,
          "activation": "relu",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "dropout_2",
            0,
            0
          ]
        ]
      },
      {
        "name": "batch_normalization_4",
        "class_name": "BatchNormalization",
        "config": {
          "axis": {
            "class_name": "__tuple__",
            "items": [
              1
            ]
          },
          "momentum": 0.99,
          "epsilon": 0.001,
          "center": true,
          "scale": true,
          "beta_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "gamma_initializer": {
            "class_name": "Ones",
            "config": {}
          },
          "moving_mean_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "moving_variance_initializer": {
            "class_name": "Ones",
            "config": {}
          },
          "beta_regularizer": null,
          "gamma_regularizer": null,
          "renorm": false,
          "renorm_momentum": 0.99,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "dense_1",
            0,
            0
          ]
        ]
      },
      {
        "name": "dropout_3",
        "class_name": "Dropout",
        "config": {
          "rate": 0.5,
          "noise_shape": null,
          "seed": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "batch_normalization_4",
            0,
            0
          ]
        ]
      },
      {
        "name": "dense_2",
        "class_name": "Dense",
        "config": {
          "units": 64,
          "activation": "relu",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "dropout_3",
            0,
            0
          ]
        ]
      },
      {
        "name": "batch_normalization_5",
        "class_name": "BatchNormalization",
        "config": {
          "axis": {
            "class_name": "__tuple__",
            "items": [
              1
            ]
          },
          "momentum": 0.99,
          "epsilon": 0.001,
          "center": true,
          "scale": true,
          "beta_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "gamma_initializer": {
            "class_name": "Ones",
            "config": {}
          },
          "moving_mean_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "moving_variance_initializer": {
            "class_name": "Ones",
            "config": {}
          },
          "beta_regularizer": null,
          "gamma_regularizer": null,
          "renorm": false,
          "renorm_momentum": 0.99,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "dense_2",
            0,
            0
          ]
        ]
      },
      {
        "name": "dropout_4",
        "class_name": "Dropout",
        "config": {
          "rate": 0.3,
          "noise_shape": null,
          "seed": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "batch_normalization_5",
            0,
            0
          ]
        ]
      },
      {
        "name": "dense_3",
        "class_name": "Dense",
        "config": {
          "units": 4,
          "activation": "softmax",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "dropout_4",
            0,
            0
          ]
        ]
      }
    ],
    "input_layers": [
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ],
      [
        "input_1",
        0,
        0
      ]
    ],
    "output_layers": [
      [
        "input_1",
        0,
        0
      ],
      [
        "conv2d",
        0,
        0
      ],
      [
        "conv2d_1",
        0,
        0
      ],
      [
        "max_pooling2d",
        0,
        0
      ],
      [
        "conv2d_2",
        0,
        0
      ],
      [
        "conv2d_3",
        0,
        0
      ],
      [
        "batch_normalization",
        0,
        0
      ],
      [
        "max_pooling2d_1",
        0,
        0
      ],
      [
        "conv2d_4",
        0,
        0
      ],
      [
        "conv2d_5",
        0,
        0
      ],
      [
        "batch_normalization_1",
        0,
        0
      ],
      [
        "max_pooling2d_2",
        0,
        0
      ],
      [
        "dropout",
        0,
        0
      ],
      [
        "conv2d_6",
        0,
        0
      ],
      [
        "conv2d_7",
        0,
        0
      ],
      [
        "batch_normalization_2",
        0,
        0
      ],
      [
        "max_pooling2d_3",
        0,
        0
      ],
      [
        "dropout_1",
        0,
        0
      ],
      [
        "flatten",
        0,
        0
      ],
      [
        "dense",
        0,
        0
      ],
      [
        "batch_normalization_3",
        0,
        0
      ],
      [
        "dropout_2",
        0,
        0
      ],
      [
        "dense_1",
        0,
        0
      ],
      [
        "batch_normalization_4",
        0,
        0
      ],
      [
        "dropout_3",
        0,
        0
      ],
      [
        "dense_2",
        0,
        0
      ],
      [
        "batch_normalization_5",
        0,
        0
      ],
      [
        "dropout_4",
        0,
        0
      ],
      [
        "dense_3",
        0,
        0
      ]
    ]
  },
  "shared_object_id": 1,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      176,
      208,
      3
    ]
  }
}2
§root.layer_with_weights-0"_tf_keras_layer*Ì{
  "name": "conv2d",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 4,
      "MaxNdim": null,
      "Axes": {
        "-1": 3
      }
    },
    "shared_object_id": 2
  },
  "class_name": "Conv2D",
  "config": {
    "filters": 8,
    "kernel_size": {
      "class_name": "__tuple__",
      "items": [
        3,
        3
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "padding": "same",
    "data_format": "channels_last",
    "dilation_rate": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "groups": 1,
    "activation": "relu",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 3,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      176,
      208,
      3
    ]
  }
}2
¶root.layer_with_weights-1"_tf_keras_layer*Ô{
  "name": "conv2d_1",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 4,
      "MaxNdim": null,
      "Axes": {
        "-1": 8
      }
    },
    "shared_object_id": 4
  },
  "class_name": "Conv2D",
  "config": {
    "filters": 8,
    "kernel_size": {
      "class_name": "__tuple__",
      "items": [
        3,
        3
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "padding": "same",
    "data_format": "channels_last",
    "dilation_rate": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "groups": 1,
    "activation": "relu",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 5,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      176,
      208,
      8
    ]
  }
}2
Çroot.layer-2"_tf_keras_layer*ÿ{
  "name": "max_pooling2d",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "MaxPooling2D",
  "config": {
    "pool_size": {
      "class_name": "__tuple__",
      "items": [
        2,
        2
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        2,
        2
      ]
    },
    "padding": "valid",
    "data_format": "channels_last",
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 6,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      176,
      208,
      8
    ]
  }
}2
¶root.layer_with_weights-2"_tf_keras_layer*Ô{
  "name": "conv2d_2",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 4,
      "MaxNdim": null,
      "Axes": {
        "-1": 8
      }
    },
    "shared_object_id": 7
  },
  "class_name": "Conv2D",
  "config": {
    "filters": 32,
    "kernel_size": {
      "class_name": "__tuple__",
      "items": [
        3,
        3
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "padding": "same",
    "data_format": "channels_last",
    "dilation_rate": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "groups": 1,
    "activation": "relu",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 8,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      88,
      104,
      8
    ]
  }
}2
©root.layer_with_weights-3"_tf_keras_layer*Ú{
  "name": "conv2d_3",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 4,
      "MaxNdim": null,
      "Axes": {
        "-1": 32
      }
    },
    "shared_object_id": 9
  },
  "class_name": "Conv2D",
  "config": {
    "filters": 32,
    "kernel_size": {
      "class_name": "__tuple__",
      "items": [
        3,
        3
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "padding": "same",
    "data_format": "channels_last",
    "dilation_rate": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "groups": 1,
    "activation": "relu",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 10,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      88,
      104,
      32
    ]
  }
}2
ïroot.layer_with_weights-4"_tf_keras_layer*ﬁ
{
  "name": "batch_normalization",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": 4,
      "MinNdim": null,
      "MaxNdim": null,
      "Axes": {
        "3": 32
      }
    },
    "shared_object_id": 11
  },
  "class_name": "BatchNormalization",
  "config": {
    "axis": {
      "class_name": "__tuple__",
      "items": [
        3
      ]
    },
    "momentum": 0.99,
    "epsilon": 0.001,
    "center": true,
    "scale": true,
    "beta_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "gamma_initializer": {
      "class_name": "Ones",
      "config": {}
    },
    "moving_mean_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "moving_variance_initializer": {
      "class_name": "Ones",
      "config": {}
    },
    "beta_regularizer": null,
    "gamma_regularizer": null,
    "renorm": false,
    "renorm_momentum": 0.99,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 12,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      88,
      104,
      32
    ]
  }
}2
Öroot.layer-6"_tf_keras_layer*€{
  "name": "max_pooling2d_1",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "MaxPooling2D",
  "config": {
    "pool_size": {
      "class_name": "__tuple__",
      "items": [
        2,
        2
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        2,
        2
      ]
    },
    "padding": "valid",
    "data_format": "channels_last",
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 13,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      88,
      104,
      32
    ]
  }
}2
©root.layer_with_weights-5"_tf_keras_layer*Ú{
  "name": "conv2d_4",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 4,
      "MaxNdim": null,
      "Axes": {
        "-1": 32
      }
    },
    "shared_object_id": 14
  },
  "class_name": "Conv2D",
  "config": {
    "filters": 64,
    "kernel_size": {
      "class_name": "__tuple__",
      "items": [
        3,
        3
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "padding": "same",
    "data_format": "channels_last",
    "dilation_rate": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "groups": 1,
    "activation": "relu",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 15,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      44,
      52,
      32
    ]
  }
}2
©	root.layer_with_weights-6"_tf_keras_layer*Ú{
  "name": "conv2d_5",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 4,
      "MaxNdim": null,
      "Axes": {
        "-1": 64
      }
    },
    "shared_object_id": 16
  },
  "class_name": "Conv2D",
  "config": {
    "filters": 64,
    "kernel_size": {
      "class_name": "__tuple__",
      "items": [
        3,
        3
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "padding": "same",
    "data_format": "channels_last",
    "dilation_rate": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "groups": 1,
    "activation": "relu",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 17,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      44,
      52,
      64
    ]
  }
}2
ñ
root.layer_with_weights-7"_tf_keras_layer*ﬂ
{
  "name": "batch_normalization_1",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": 4,
      "MinNdim": null,
      "MaxNdim": null,
      "Axes": {
        "3": 64
      }
    },
    "shared_object_id": 18
  },
  "class_name": "BatchNormalization",
  "config": {
    "axis": {
      "class_name": "__tuple__",
      "items": [
        3
      ]
    },
    "momentum": 0.99,
    "epsilon": 0.001,
    "center": true,
    "scale": true,
    "beta_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "gamma_initializer": {
      "class_name": "Ones",
      "config": {}
    },
    "moving_mean_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "moving_variance_initializer": {
      "class_name": "Ones",
      "config": {}
    },
    "beta_regularizer": null,
    "gamma_regularizer": null,
    "renorm": false,
    "renorm_momentum": 0.99,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 19,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      44,
      52,
      64
    ]
  }
}2
Öroot.layer-10"_tf_keras_layer*⁄{
  "name": "max_pooling2d_2",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "MaxPooling2D",
  "config": {
    "pool_size": {
      "class_name": "__tuple__",
      "items": [
        2,
        2
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        2,
        2
      ]
    },
    "padding": "valid",
    "data_format": "channels_last",
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 20,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      44,
      52,
      64
    ]
  }
}2
õroot.layer-11"_tf_keras_layer*{
  "name": "dropout",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "Dropout",
  "config": {
    "rate": 0.2,
    "noise_shape": null,
    "seed": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 21,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      22,
      26,
      64
    ]
  }
}2
™root.layer_with_weights-8"_tf_keras_layer*Û{
  "name": "conv2d_6",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 4,
      "MaxNdim": null,
      "Axes": {
        "-1": 64
      }
    },
    "shared_object_id": 22
  },
  "class_name": "Conv2D",
  "config": {
    "filters": 128,
    "kernel_size": {
      "class_name": "__tuple__",
      "items": [
        3,
        3
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "padding": "same",
    "data_format": "channels_last",
    "dilation_rate": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "groups": 1,
    "activation": "relu",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 23,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      22,
      26,
      64
    ]
  }
}2
¨root.layer_with_weights-9"_tf_keras_layer*ı{
  "name": "conv2d_7",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 4,
      "MaxNdim": null,
      "Axes": {
        "-1": 128
      }
    },
    "shared_object_id": 24
  },
  "class_name": "Conv2D",
  "config": {
    "filters": 128,
    "kernel_size": {
      "class_name": "__tuple__",
      "items": [
        3,
        3
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "padding": "same",
    "data_format": "channels_last",
    "dilation_rate": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "groups": 1,
    "activation": "relu",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 25,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      22,
      26,
      128
    ]
  }
}2
ôroot.layer_with_weights-10"_tf_keras_layer*·
{
  "name": "batch_normalization_2",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": 4,
      "MinNdim": null,
      "MaxNdim": null,
      "Axes": {
        "3": 128
      }
    },
    "shared_object_id": 26
  },
  "class_name": "BatchNormalization",
  "config": {
    "axis": {
      "class_name": "__tuple__",
      "items": [
        3
      ]
    },
    "momentum": 0.99,
    "epsilon": 0.001,
    "center": true,
    "scale": true,
    "beta_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "gamma_initializer": {
      "class_name": "Ones",
      "config": {}
    },
    "moving_mean_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "moving_variance_initializer": {
      "class_name": "Ones",
      "config": {}
    },
    "beta_regularizer": null,
    "gamma_regularizer": null,
    "renorm": false,
    "renorm_momentum": 0.99,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 27,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      22,
      26,
      128
    ]
  }
}2
Üroot.layer-15"_tf_keras_layer*€{
  "name": "max_pooling2d_3",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "MaxPooling2D",
  "config": {
    "pool_size": {
      "class_name": "__tuple__",
      "items": [
        2,
        2
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        2,
        2
      ]
    },
    "padding": "valid",
    "data_format": "channels_last",
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 28,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      22,
      26,
      128
    ]
  }
}2
ûroot.layer-16"_tf_keras_layer*Û{
  "name": "dropout_1",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "Dropout",
  "config": {
    "rate": 0.2,
    "noise_shape": null,
    "seed": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 29,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      11,
      13,
      128
    ]
  }
}2
Çroot.layer-17"_tf_keras_layer*◊{
  "name": "flatten",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "Flatten",
  "config": {
    "data_format": "channels_last",
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 30,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      11,
      13,
      128
    ]
  }
}2
Úroot.layer_with_weights-11"_tf_keras_layer*∫{
  "name": "dense",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 2,
      "MaxNdim": null,
      "Axes": {
        "-1": 18304
      }
    },
    "shared_object_id": 31
  },
  "class_name": "Dense",
  "config": {
    "units": 256,
    "activation": "relu",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 32,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      18304
    ]
  }
}2
Éroot.layer_with_weights-12"_tf_keras_layer*À
{
  "name": "batch_normalization_3",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": 2,
      "MinNdim": null,
      "MaxNdim": null,
      "Axes": {
        "1": 256
      }
    },
    "shared_object_id": 33
  },
  "class_name": "BatchNormalization",
  "config": {
    "axis": {
      "class_name": "__tuple__",
      "items": [
        1
      ]
    },
    "momentum": 0.99,
    "epsilon": 0.001,
    "center": true,
    "scale": true,
    "beta_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "gamma_initializer": {
      "class_name": "Ones",
      "config": {}
    },
    "moving_mean_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "moving_variance_initializer": {
      "class_name": "Ones",
      "config": {}
    },
    "beta_regularizer": null,
    "gamma_regularizer": null,
    "renorm": false,
    "renorm_momentum": 0.99,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 34,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      256
    ]
  }
}2
àroot.layer-20"_tf_keras_layer*›{
  "name": "dropout_2",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "Dropout",
  "config": {
    "rate": 0.7,
    "noise_shape": null,
    "seed": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 35,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      256
    ]
  }
}2
root.layer_with_weights-13"_tf_keras_layer*∏{
  "name": "dense_1",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 2,
      "MaxNdim": null,
      "Axes": {
        "-1": 256
      }
    },
    "shared_object_id": 36
  },
  "class_name": "Dense",
  "config": {
    "units": 128,
    "activation": "relu",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 37,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      256
    ]
  }
}2
Éroot.layer_with_weights-14"_tf_keras_layer*À
{
  "name": "batch_normalization_4",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": 2,
      "MinNdim": null,
      "MaxNdim": null,
      "Axes": {
        "1": 128
      }
    },
    "shared_object_id": 38
  },
  "class_name": "BatchNormalization",
  "config": {
    "axis": {
      "class_name": "__tuple__",
      "items": [
        1
      ]
    },
    "momentum": 0.99,
    "epsilon": 0.001,
    "center": true,
    "scale": true,
    "beta_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "gamma_initializer": {
      "class_name": "Ones",
      "config": {}
    },
    "moving_mean_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "moving_variance_initializer": {
      "class_name": "Ones",
      "config": {}
    },
    "beta_regularizer": null,
    "gamma_regularizer": null,
    "renorm": false,
    "renorm_momentum": 0.99,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 39,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      128
    ]
  }
}2
àroot.layer-23"_tf_keras_layer*›{
  "name": "dropout_3",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "Dropout",
  "config": {
    "rate": 0.5,
    "noise_shape": null,
    "seed": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 40,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      128
    ]
  }
}2
Ôroot.layer_with_weights-15"_tf_keras_layer*∑{
  "name": "dense_2",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 2,
      "MaxNdim": null,
      "Axes": {
        "-1": 128
      }
    },
    "shared_object_id": 41
  },
  "class_name": "Dense",
  "config": {
    "units": 64,
    "activation": "relu",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 42,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      128
    ]
  }
}2
Åroot.layer_with_weights-16"_tf_keras_layer*…
{
  "name": "batch_normalization_5",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": 2,
      "MinNdim": null,
      "MaxNdim": null,
      "Axes": {
        "1": 64
      }
    },
    "shared_object_id": 43
  },
  "class_name": "BatchNormalization",
  "config": {
    "axis": {
      "class_name": "__tuple__",
      "items": [
        1
      ]
    },
    "momentum": 0.99,
    "epsilon": 0.001,
    "center": true,
    "scale": true,
    "beta_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "gamma_initializer": {
      "class_name": "Ones",
      "config": {}
    },
    "moving_mean_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "moving_variance_initializer": {
      "class_name": "Ones",
      "config": {}
    },
    "beta_regularizer": null,
    "gamma_regularizer": null,
    "renorm": false,
    "renorm_momentum": 0.99,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 44,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      64
    ]
  }
}2
ároot.layer-26"_tf_keras_layer*‹{
  "name": "dropout_4",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "Dropout",
  "config": {
    "rate": 0.3,
    "noise_shape": null,
    "seed": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 45,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      64
    ]
  }
}2
Ôroot.layer_with_weights-17"_tf_keras_layer*∑{
  "name": "dense_3",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 2,
      "MaxNdim": null,
      "Axes": {
        "-1": 64
      }
    },
    "shared_object_id": 46
  },
  "class_name": "Dense",
  "config": {
    "units": 4,
    "activation": "softmax",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 47,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      64
    ]
  }
}2