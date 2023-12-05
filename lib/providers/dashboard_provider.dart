import 'package:flutter/cupertino.dart';
import 'package:jiffy/jiffy.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardProvider extends ChangeNotifier{

  onInit(context){
    notifyListeners();
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  int selectedIndex = -1;
  List<String> names = [
    "John",
    "Jane",
    "Alice",
    "Bob",
    "Charlie",
    "David",
    "Eva",
    "Frank"
  ];

  // String selectedDate = '';
  DateTime? selectedDay;

  // String dateCount = '';
  // String range = '';
  // String rangeCount = '';
  bool onChange = false;
  DateTime focusedDay = DateTime.now();

  void onDaySelected(DateTime selectDay, DateTime focusDay) {
    if (!isSameDay(selectedDay, selectedDay)) {

        selectedDay = selectDay;
        focusedDay = focusDay;
        notifyListeners();
    }
  }

  // int currentValue = 1;
  // final int totalCount = 12;
  // final int initValue = 5;
  DateTime? rangeStart;
  DateTime? rangeEnd;
  CalendarFormat calendarFormat = CalendarFormat.month;
  String? endedRange;
  String? startedRange;

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusDay) {

      selectedDay = null;
      focusedDay = focusDay;
      rangeStart = start;
      rangeEnd = end;
      startedRange =
          Jiffy.parseFromDateTime(rangeStart!).format(pattern: "do MMM");
      if (end != null) {
        endedRange =
            Jiffy.parseFromDateTime(rangeEnd!).format(pattern: "do MMM yyyy");
      }
   notifyListeners();
  }

  TooltipBehavior? tooltipBehavior;




}