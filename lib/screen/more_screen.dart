import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trucker/dropdown/drop_down.dart';

import '../model/chart_data.dart';
import '../model/current_item.dart';

class MoreScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {

    final List<ChartData> chartData = [
      ChartData(DateTime(1), 3),
      ChartData(DateTime(2), 3),
      ChartData(DateTime(3), 3),
      ChartData(DateTime(4), 1),
      ChartData(DateTime(5), 1),
      ChartData(DateTime(6), 2),
      ChartData(DateTime(7), 2),
      ChartData(DateTime(8), 0),
      ChartData(DateTime(9), 0),
      ChartData(DateTime(10), 0),
      ChartData(DateTime(11), 0),
      ChartData(DateTime(12), 0),
      ChartData(DateTime(13), 1),
      ChartData(DateTime(14), 1),
      ChartData(DateTime(15), 1),
      ChartData(DateTime(16), 1),
      ChartData(DateTime(17), 1),
      ChartData(DateTime(18), 1),
      ChartData(DateTime(19), 1),
      ChartData(DateTime(20), 3),
      ChartData(DateTime(21), 3),
      ChartData(DateTime(22), 3),
    ];

    return Container(
      height: 200,
      child: SfCartesianChart(
          primaryXAxis: DateTimeAxis(opposedPosition: true, interval: 1),
          series: <ChartSeries>[
            // Renders step line chart
            StepLineSeries<ChartData, DateTime>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y)
          ]),
    );
  }
}
