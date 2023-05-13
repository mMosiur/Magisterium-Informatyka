namespace Plot

module Plot =

    type TrainingMetricsData =
        { TrainAccuracy: float[]
          TrainLoss: float[]
          ValidationAccuracy: float[] option
          ValidationLoss: float[] option }
