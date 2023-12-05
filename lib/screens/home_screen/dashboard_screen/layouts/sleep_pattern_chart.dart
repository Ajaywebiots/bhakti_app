import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../config.dart';

class SleepPatternChart extends StatelessWidget {
  const SleepPatternChart({super.key});

  @override
  Widget build(BuildContext context) {


    return SfCartesianChart(
        legend: const Legend(
            isVisible: true,
            padding: 2,
            itemPadding: 10,
            position: LegendPosition.bottom,
            iconWidth: Sizes.s10,
            iconHeight: Sizes.s10),
        series: <CandleSeries>[
          CandleSeries<_ChartData, DateTime>(
              bearColor: appColor(context).appTheme.primary,enableSolidCandles: true,
              bullColor: appColor(context).appTheme.primary,
              legendIconType: LegendIconType.circle,
              dataSource: [
                _ChartData(
                    DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day),1,2,3,4),
                _ChartData(
                    DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day-1),3,5,4,6),
                _ChartData(
                    DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day-2),1,2,3,5),
                _ChartData(
                    DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day-3),2,3,6,2),
                _ChartData(
                    DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day-4),2,3,6,2),
                _ChartData(
                    DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day-5),2,3,6,2),
                _ChartData(
                    DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day-6),2,3,6,2),
              ],
              xValueMapper: (_ChartData data, _) => data.xDate,
              lowValueMapper: (_ChartData data, _) => data.low,
              highValueMapper: (_ChartData data, _) => data.high,
              openValueMapper: (_ChartData data, _) => data.open,
              closeValueMapper: (_ChartData data, _) => data.close),
        ],
        primaryXAxis: DateTimeAxis(dateFormat: DateFormat('dd MMM')),
        primaryYAxis: DateTimeAxis(dateFormat: DateFormat('hh:mm:a')));
  }
}

class _ChartData {
  _ChartData(this.xDate, this.low, this.high, this.open, this.close);
  final dynamic xDate;
  final dynamic low;
  final dynamic high;
  final dynamic open;
  final dynamic close;
}
