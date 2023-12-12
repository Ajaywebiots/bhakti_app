import 'dart:developer';
import 'package:intl/intl.dart';
import '../../../../config.dart';

class ChantingChart extends StatefulWidget {
  const ChantingChart({super.key});

  @override
  State<ChantingChart> createState() => _ChantingChartState();
}

class _ChantingChartState extends State<ChantingChart> {


  int timeToNum(String timeString) {
    DateTime dateTime = DateFormat('hh').parse(timeString);
    int minutesSinceMidnight = dateTime.hour * 60 + dateTime.minute;
    return minutesSinceMidnight;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    log("ajldfhjkashdfa${dateAndTimeFormat()}");

    ss = dateAndTimeFormat();
    log("asdadasd ${ss[0]}");


    String timeString = '02';
    int numericValue = timeToNum(timeString);
    log('Numeric value for $timeString: $numericValue minutes');
  }

  List ss = [];


  List<String> dateAndTimeFormat() {
    var now = DateTime.now();
    var dateList = <String>[];

    for (int i = 6; i >= 0; i--) {
      var currentDate = now.subtract(Duration(days: i));
      var formattedDate = DateFormat('dd MMM').format(currentDate);
      dateList.add(formattedDate);
    }

    log("List of dates for the last 7 days: $dateList");

    return dateList;
  }


  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(ss[0], 1701963573000,4 ),
      ChartData(ss[1], 1702049973000,5 ),
      ChartData(ss[2], 1702049973000,5 ),
      ChartData(ss[3],1701963573000,2),
      ChartData(ss[4], 1702413573000,8),
      ChartData(ss[5], 1702049973000,9),
      ChartData(ss[6], 1702413573000,7),
    ];
   /* List<SalesData> data = [
      SalesData(DateTime.utc(2023,12,07,5,10), DateTime.utc(2023,12,07,5,10)),
      SalesData(DateTime.utc(2023,12,08,6,10), DateTime.utc(2023,12,08,8,10)),
      SalesData(DateTime.utc(2023,12,09,8,5), DateTime.utc(2023,12,09,5,10)),
      SalesData(DateTime.utc(2023,12,10,10,00), DateTime.utc(2023,12,11,5,10)),
      SalesData(DateTime.utc(2023,12,11,12,6), DateTime.utc(2023,12,12,5,10))
    ];*/
    DateTime startTime = (DateTime.now().subtract(const Duration(days: 6)));
    DateTime endTime = DateTime.now();
   /* return SfCartesianChart(
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
            majorGridLines: const MajorGridLines(width: 0),
            minorGridLines: const MinorGridLines(width: 0)),
        primaryYAxis: DateTimeAxis(maximum: startTime,minimum: endTime,
          majorTickLines: const MajorTickLines(size: 0),
          minorTickLines: const MinorTickLines(size: 0),
          axisLine: const AxisLine(width: 0),labelFormat: DateFormat('hh aa').format(DateTime.now()),
          majorGridLines: const MajorGridLines(dashArray: <double>[4, 2]),
          minorGridLines: const MinorGridLines(dashArray: <double>[4, 2]),
        ),
        series: <ChartSeries>[
          StackedColumnSeries<ChartData, String>(
              width: 0.3,
              legendIconType: LegendIconType.circle,
              legendItemText: '10 Rounds',
              color: appColor(context).appTheme.primary,
              dataSource: chartData,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(2), topLeft: Radius.circular(2)),
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y1),
          StackedColumnSeries<ChartData, String>(
              width: 0.3,
              legendIconType: LegendIconType.circle,
              legendItemText: '20 Rounds',
              color: const Color(0xff794F7F),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(2), topLeft: Radius.circular(2)),
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y2),

        ]).inkWell(onTap: () {
      dateAndTimeFormat();
      log("message print thay 6e");
    });*/
    return  SfCartesianChart(

        // Chart title
        title: ChartTitle(text: 'Half yearly sales analysis'),
        // Enable legend
        legend: Legend(isVisible: true),
        primaryXAxis: CategoryAxis(

            majorTickLines: const MajorTickLines(size: 0),
            minorTickLines: const MinorTickLines(size: 0),
            majorGridLines: const MajorGridLines(width: 0),
            minorGridLines: const MinorGridLines(width: 0)),
        // Enable tooltip
        primaryYAxis: DateTimeAxis(maximum: startTime,minimum: endTime,
          majorTickLines: const MajorTickLines(size: 0),
          minorTickLines: const MinorTickLines(size: 0),
          axisLine: const AxisLine(width: 0),labelFormat: DateFormat('hh aa').format(DateTime.now()),
          majorGridLines: const MajorGridLines(dashArray: <double>[4, 2]),
          minorGridLines: const MinorGridLines(dashArray: <double>[4, 2]),
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[
          StackedColumnSeries<ChartData, String>(
              width: 0.3,
              legendIconType: LegendIconType.circle,
              legendItemText: '10 Rounds',
              color: appColor(context).appTheme.primary,
              dataSource: chartData,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(2), topLeft: Radius.circular(2)),
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y),
          StackedColumnSeries<ChartData, String>(
              width: 0.3,
              legendIconType: LegendIconType.circle,
              legendItemText: '20 Rounds',
              color: const Color(0xff794F7F),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(2), topLeft: Radius.circular(2)),
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y1),

        ]);
  }
}

//
class ChartData {
  ChartData(
      this.x, this.y, this.y1);

  final String x;
  final int y;
  final int y1;
}

class SalesData {
  SalesData(this.year, this.sales);

  final DateTime year;
  final DateTime sales;
}