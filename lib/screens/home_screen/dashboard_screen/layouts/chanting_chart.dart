import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../config.dart';

class ChantingChart extends StatelessWidget {
  const ChantingChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('01 Dec', 12, 10, 14, 20),
      ChartData('02 Dec', 14, 11, 18, 23),
      ChartData('03 Dec', 16, 10, 15, 20),
      ChartData('04 Dec', 18, 16, 18, 24),
      ChartData('05 Dec', 20, 11, 16, 22),
      ChartData('06 Dec', 18, 16, 18, 23),
      ChartData('07 Dec', 03, 05, 31, 21),
    ];
    return  SfCartesianChart(
        legend: const Legend(
            isVisible: true,
            padding: 2,
            itemPadding: 10,
            position: LegendPosition.bottom,
            iconWidth: 10,
            iconHeight: 10),
        palette: const [Colors.black],
        plotAreaBorderColor: Colors.transparent,
        plotAreaBorderWidth: 0,
        enableAxisAnimation: true,
        primaryXAxis: CategoryAxis(
            majorTickLines: const MajorTickLines(size: 0),
            minorTickLines: const MinorTickLines(size: 0),
            majorGridLines:
            const MajorGridLines(width: 0),
            minorGridLines:
            const MinorGridLines(width: 0)),
        primaryYAxis: DateTimeAxis(
          majorTickLines: const MajorTickLines(size: 0),
          minorTickLines: const MinorTickLines(size: 0),
          axisLine: const AxisLine(width: 0),
          majorGridLines: const MajorGridLines(
              dashArray: <double>[4, 2]),
          minorGridLines: const MinorGridLines(
              dashArray: <double>[4, 2]),
        ),
        series: <ChartSeries>[
          StackedColumnSeries<ChartData, String>(
              width: 0.3,
              legendIconType: LegendIconType.circle,
              legendItemText: '10 Rounds',
              color: appColor(context).appTheme.primary,
              dataSource: chartData,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(2),
                  topLeft: Radius.circular(2)),
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) =>
              data.y1),
          StackedColumnSeries<ChartData, String>(
              width: 0.3,
              legendIconType: LegendIconType.circle,
              legendItemText: '20 Rounds',
              color: const Color(0xff794F7F),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(2),
                  topLeft: Radius.circular(2)),
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) =>
              data.y2),
          StackedColumnSeries<ChartData, String>(
              color: const Color(0xffA081A4),
              legendIconType: LegendIconType.circle,
              width: 0.3,
              legendItemText: '30 Rounds',
              dataSource: chartData,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(2),
                  topLeft: Radius.circular(2)),
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) =>
              data.y3),
          StackedColumnSeries<ChartData, String>(
              color: const Color(0xffDAC4D8),
              legendIconType: LegendIconType.circle,
              width: 0.3,
              legendItemText: '40 Rounds',
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(2),
                  topLeft: Radius.circular(2)),
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) =>
              data.y4)
        ]);
  }
}


class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);

  final dynamic x;
  final dynamic y1;
  final dynamic y2;
  final dynamic y3;
  final dynamic y4;
}