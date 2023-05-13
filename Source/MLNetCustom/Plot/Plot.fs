namespace MLNetCustom

open Plotly.NET

module Plot =

    let GenerateSingleMetricsChart
        (x: seq<float>)
        (y_accuracy: seq<float>)
        (y_loss: seq<float>)
        : GenericChart.GenericChart =

        let chart1 =
            Chart.Line(x = x, y = y_accuracy, Name = "Accuracy")
            |> Chart.withAxisAnchor (Y = 1)

        let chart2 =
            Chart.Line(x = x, y = y_loss, Name = "Loss (Cross-entropy)")
            |> Chart.withAxisAnchor (Y = 2)

        let combinedChart =
            [ chart1; chart2 ]
            |> Chart.combine
            |> Chart.withYAxisStyle (
                TitleText = "Accuracy",
                Side = StyleParam.Side.Left,
                Id = StyleParam.SubPlotId.YAxis 1,
                MinMax = (0.0, 1.0)
            )
            |> Chart.withYAxisStyle (
                TitleText = "Loss",
                Side = StyleParam.Side.Right,
                Id = StyleParam.SubPlotId.YAxis 2,
                Overlaying = StyleParam.LinearAxisId.Y 1,
                MinMax = (0.0, 3.0)
            )
            |> Chart.withXAxisStyle (TitleText = "Epoch")

        combinedChart

    let GenerateDoubleMetricsChart
        (x: seq<float>)
        (y_train_accuracy: seq<float>)
        (y_train_loss: seq<float>)
        (y_validation_accuracy: seq<float>)
        (y_validation_loss: seq<float>)
        : GenericChart.GenericChart =

        let chart1 =
            Chart.Line(x = x, y = y_train_accuracy, Name = "Train accuracy")
            |> Chart.withAxisAnchor (Y = 1)

        let chart2 =
            Chart.Line(x = x, y = y_train_loss, Name = "Train loss (Cross-entropy)")
            |> Chart.withAxisAnchor (Y = 2)

        let chart3 =
            Chart.Line(x = x, y = y_validation_accuracy, Name = "Validation accuracy")
            |> Chart.withAxisAnchor (Y = 1)

        let chart4 =
            Chart.Line(x = x, y = y_validation_loss, Name = "Validation loss (Cross-entropy)")
            |> Chart.withAxisAnchor (Y = 2)

        let combinedChart =
            [ chart1; chart2; chart3; chart4 ]
            |> Chart.combine
            |> Chart.withYAxisStyle (
                TitleText = "Accuracy",
                Side = StyleParam.Side.Left,
                Id = StyleParam.SubPlotId.YAxis 1,
                MinMax = (0.0, 1.0)
            )
            |> Chart.withYAxisStyle (
                TitleText = "Loss",
                Side = StyleParam.Side.Right,
                Id = StyleParam.SubPlotId.YAxis 2,
                Overlaying = StyleParam.LinearAxisId.Y 1,
                MinMax = (0.0, 3.0)
            )
            |> Chart.withXAxisStyle (TitleText = "Epoch")

        combinedChart
