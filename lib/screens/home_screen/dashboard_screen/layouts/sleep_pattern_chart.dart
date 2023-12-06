import 'dart:developer';

import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:intl/intl.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../config.dart';

class SleepPatternChart extends StatefulWidget {
  const SleepPatternChart({super.key});

  @override
  State<SleepPatternChart> createState() => _SleepPatternChartState();
}

class _SleepPatternChartState extends State<SleepPatternChart> {
  bool whichCandleMock = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black,
        constraints: const BoxConstraints(
          maxHeight: 400,
          maxWidth: 600,
        ),
        padding: const EdgeInsets.all(24),
        child: Chart(
          layers: layers(),
          padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(
            bottom: 12,
          ),
        ),
      ),
    );

    /*SfCartesianChart(
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
        primaryYAxis: DateTimeAxis(dateFormat: DateFormat('hh:mm:a')))*/
  }

  List<ChartLayer> layers() {
    final double frequency =
        (DateTime(2023, 12, 6).millisecondsSinceEpoch.toDouble() -
            DateTime(2023, 11, 30).millisecondsSinceEpoch.toDouble());
    final double frequencyData = frequency / 3;
    final double from = DateTime(2017, 4).millisecondsSinceEpoch.toDouble();
    return [
      ChartGridLayer(
          settings: ChartGridSettings(
              x: ChartGridSettingsAxis(
                  color: Colors.white.withOpacity(0.2),
                  frequency: frequency,
                  max: DateTime(2017, 11).millisecondsSinceEpoch.toDouble(),
                  min: DateTime(2017, 4).millisecondsSinceEpoch.toDouble()),
              y: ChartGridSettingsAxis(
                  color: Colors.white.withOpacity(0.2),
                  frequency: 3.0,
                  max: 66.0,
                  min: 48.0))),
      ChartAxisLayer(
          settings: ChartAxisSettings(
              x: ChartAxisSettingsAxis(
                  frequency: frequency,
                  max: DateTime(2017, 11).millisecondsSinceEpoch.toDouble(),
                  min: DateTime(2017, 4).millisecondsSinceEpoch.toDouble(),
                  textStyle: TextStyle(
                      color: Colors.white.withOpacity(0.6), fontSize: 10.0)),
              y: ChartAxisSettingsAxis(
                  frequency: 3.0,
                  max: 66.0,
                  min: 48.0,
                  textStyle: TextStyle(
                      color: Colors.white.withOpacity(0.6), fontSize: 10.0))),
          labelX: (value) => DateFormat('MMM yyyy')
              .format(DateTime.fromMillisecondsSinceEpoch(value.toInt())),
          labelY: (value) => value.toInt().toString()),
      ChartCandleLayer(items: [
        candleItem(Colors.red, 62.0, 64.0, 61.0, 64.0, from),
        candleItem(Colors.red, 64.0, 66.0, 63.0, 66.0, from + frequencyData),
        candleItem(
            Colors.red, 63.0, 65.0, 62.0, 66.0, from + 2 * frequencyData),
        candleItem(
            Colors.red, 60.0, 62.0, 57.0, 61.0, from + 3 * frequencyData),
        candleItem(
            Colors.red, 57.0, 59.0, 57.0, 60.0, from + 4 * frequencyData),
        candleItem(
            Colors.red, 57.5, 59.0, 56.5, 60.3, from + 5 * frequencyData),
        candleItem(Colors.red, 58.0, 60.0, 57.0, 61.0, from + 6 * frequencyData)
      ], settings: const ChartCandleSettings())
    ];
  }

  static candleItem(Color color, double min1, double max1, double min2,
      double max2, double x) {
    return ChartCandleDataItem(
        color: color,
        value1: ChartCandleDataItemValue(max: max1, min: min1),
        value2: ChartCandleDataItemValue(max: max2, min: min2),
        x: x);
  }
}

//
// class _ChartData {
//   _ChartData(this.xDate, this.low, this.high, this.open, this.close);
//   final dynamic xDate;
//   final dynamic low;
//   final dynamic high;
//   final dynamic open;
//   final dynamic close;
// }
