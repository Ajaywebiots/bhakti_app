import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../config.dart';

class AssociationChart extends StatelessWidget {
  const AssociationChart({super.key});

  @override
  Widget build(BuildContext context) {
    final LinearGradient linearGradient = LinearGradient(
      colors: <Color>[
        appColor(context).appTheme.primary.withOpacity(0.2),
        appColor(context).appTheme.primary.withOpacity(0.08),
        appColor(context).appTheme.primary.withOpacity(0.01),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    return SfCartesianChart(
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
            intervalType: DateTimeIntervalType.hours,
            dateFormat: DateFormat('hh a'),
            minimum: DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                DateTime.now().hour,
                DateTime.now().minute),
            maximum: DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                DateTime.now().hour + 12,
                DateTime.now().minute)),
        series: <CartesianSeries>[
          AreaSeries<SalesData, dynamic>(
              color: appColor(context).appTheme.primary,
              borderColor:
              appColor(context).appTheme.primary,
              borderWidth: 2,
              gradient: linearGradient,
                dataSource: <SalesData>[
                  SalesData(
                      "Bhawadgita",
                      DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          DateTime.now().hour + 6)),
                  SalesData(
                      "Bhagwatam",
                      DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          DateTime.now().hour + 4)),
                  SalesData(
                      "Ramayan",
                      DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          DateTime.now().hour + 10)),
                  SalesData(
                      "Mahabharat",
                      DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          DateTime.now().hour + 8))
                ],
              xValueMapper: (SalesData time, _) => time.x,
              yValueMapper: (SalesData data, _) {
                return data.y.millisecondsSinceEpoch;
              })
        ],
        annotations: <CartesianChartAnnotation>[
          CartesianChartAnnotation(
              widget: SvgPicture.asset(eSvgAssets.chartIcon,
                  height: 12),
              coordinateUnit: CoordinateUnit.point,
              x: "Bhawadgita",
              y: DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  DateTime.now().hour + 6)
                  .millisecondsSinceEpoch),
          CartesianChartAnnotation(
              widget: SvgPicture.asset(eSvgAssets.chartIcon,
                  height: 12),
              coordinateUnit: CoordinateUnit.point,
              x: "Bhagwatam",
              y: DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  DateTime.now().hour + 4)
                  .millisecondsSinceEpoch),
          CartesianChartAnnotation(
              widget: SvgPicture.asset(eSvgAssets.chartIcon,
                  height: 12),
              coordinateUnit: CoordinateUnit.point,
              x: "Ramayan",
              y: DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  DateTime.now().hour + 10)
                  .millisecondsSinceEpoch),
          CartesianChartAnnotation(
              widget: SvgPicture.asset(eSvgAssets.chartIcon,
                  height: 12),
              coordinateUnit: CoordinateUnit.point,
              x: "Mahabharat",
              y: DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  DateTime.now().hour + 8)
                  .millisecondsSinceEpoch)
        ]);
  }
}


class SalesData {
  SalesData(this.x, this.y);

  final String x;
  final DateTime y;
}