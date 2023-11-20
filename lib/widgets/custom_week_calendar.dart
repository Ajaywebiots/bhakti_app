library horizontal_week_calendar;

import 'dart:developer';

import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../config.dart';

enum WeekStartFrom {
  Sunday,
  Monday,
}

class HorizontalWeekCalendar extends StatefulWidget {
  /// week start from [WeekStartFrom.Monday]
  final WeekStartFrom? weekStartFrom;

  ///get DateTime on date select
  final Function(DateTime)? onDateChange;

  ///get the list of DateTime on week change
  final Function(List<DateTime>)? onWeekChange;

  /// Active background color
  ///
  /// Default value [Theme.of(context).primaryColor]
  final Color? activeBackgroundColor;

  /// In-Active background color
  ///
  /// Default value [Theme.of(context).primaryColor.withOpacity(.2)]
  final Color? inactiveBackgroundColor;

  /// Disable background color
  ///
  /// Default value [Colors.grey]
  final Color? disabledBackgroundColor;

  /// Active text color
  ///
  /// Default value [Theme.of(context).primaryColor]
  final Color? activeTextColor;

  /// In-Active text color
  ///
  /// Default value [Theme.of(context).primaryColor.withOpacity(.2)]
  final Color? inactiveDateColor;
  final Color? inactiveWeekColor;

  /// Disable text color
  ///
  /// Default value [Colors.grey]
  final Color? disabledTextColor;

  /// Active Navigator color
  ///
  /// Default value [Theme.of(context).primaryColor]
  final Color? activeNavigatorColor;

  /// In-Active Navigator color
  ///
  /// Default value [Colors.grey]
  final Color? inactiveNavigatorColor;

  /// Month Color
  ///
  /// Default value [Theme.of(context).primaryColor.withOpacity(.2)]
  final Color? monthColor;
  String? selectDate;

  final DateTime? datePickChange, todayDate;



  HorizontalWeekCalendar({
    super.key,
    this.onDateChange,
    this.onWeekChange,
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.disabledBackgroundColor,
    this.activeTextColor = Colors.white,
    this.inactiveWeekColor,
    this.inactiveDateColor,
    this.disabledTextColor,
    this.activeNavigatorColor,
    this.inactiveNavigatorColor,
    this.monthColor,
    this.weekStartFrom = WeekStartFrom
        .Monday, this.datePickChange, this.todayDate, this.selectDate
  });

  @override
  State<HorizontalWeekCalendar> createState() => _HorizontalWeekCalendarState();
}

class _HorizontalWeekCalendarState extends State<HorizontalWeekCalendar> {
  CarouselController carouselController = CarouselController();
  DateTime? today, selectedDate;
  List<DateTime> currentWeek = [];
  int currentWeekIndex = 0;
  List<List<DateTime>> listOfWeeks = [];

  @override
  void initState() {
    initCalendar();
    super.initState();
  }

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  initCalendar() {
    final date = DateTime.now();
    log("SEEEE : $selectedDate");
    DateTime startOfCurrentWeek =
    getDate(date).subtract(const Duration(days: 6));
    print("CurrentDate $startOfCurrentWeek");
    currentWeek.add(startOfCurrentWeek);
    for (int index = 0; index < 6; index++) {
      DateTime addDate = startOfCurrentWeek.add(Duration(days: (index + 1)));
      currentWeek.add(addDate);
    }

    listOfWeeks.add(currentWeek);
    widget.selectDate =" ${currentWeek.first.year}-${currentWeek.first.month}-${currentWeek.first.day}";
    log("currentWeek :: ${currentWeek.first.year}-${currentWeek.first.month}-${currentWeek.first.day}");
    log("currentWeek :: ${currentWeek.last}");





    getMorePreviousWeeks();
  }
  void didUpdateWidget(covariant HorizontalWeekCalendar oldWidget) {
    if (widget.datePickChange != null) {
      // Update the calendar to the selected date from the date picker
      updateCalendarToSelectedDate(widget.datePickChange!);
    }
    super.didUpdateWidget(oldWidget);
  }

  void updateCalendarToSelectedDate(DateTime selectedDate) {
    // Clear existing data
    currentWeek = [];
    listOfWeeks = [];

    // Calculate new weeks starting from the selected date
    DateTime startOfSelectedWeek = getDate(selectedDate).subtract(
        const Duration(days: 6));
    currentWeek.add(startOfSelectedWeek);

    for (int index = 0; index < 6; index++) {
      DateTime addDate = startOfSelectedWeek.add(Duration(days: (index + 1)));
      currentWeek.add(addDate);
    }

    listOfWeeks.add(currentWeek);
    getMorePreviousWeeks();

    // Find the index of the selected week
    int selectedWeekIndex = listOfWeeks.indexWhere((week) =>
        week.contains(selectedDate));

    // Scroll to the selected week
    if (selectedWeekIndex != -1) {
      carouselController.jumpToPage(selectedWeekIndex);
      onWeekChange(selectedWeekIndex);
    }
  }

  getMorePreviousWeeks() {
    List<DateTime> minus7Days = [];
    DateTime startFrom = listOfWeeks.isEmpty
        ? DateTime.now()
        : listOfWeeks[currentWeekIndex].isEmpty
        ? DateTime.now()
        : listOfWeeks[currentWeekIndex][0];

    for (int index = 0; index < 7; index++) {
      DateTime minusDate = startFrom.add(Duration(days: -(index + 1)));
      minus7Days.add(minusDate);
    }
    listOfWeeks.add(minus7Days.reversed.toList());
    setState(() {});
  }

  onDateSelect(DateTime date) {
    setState(() {
      selectedDate = date;
    });
    widget.onDateChange?.call(selectedDate!);
  }

  onBackClick() {
    carouselController.nextPage();

  }




  onNextClick() {
    carouselController.previousPage();
  }

  onWeekChange(index) {
    // currentWeekIndex = index;
   /* log("currentWeekIndexcurrentWeekIndexcurrentWeekIndex :: $currentWeekIndex");
    currentWeek = listOfWeeks[currentWeekIndex];

    if (currentWeekIndex + 1 == listOfWeeks.length) {
      getMorePreviousWeeks();
    }

    log("currentWeekIndex : $currentWeekIndex");

    widget.onWeekChange?.call(currentWeek);*/
    // setState(() {});
  }

  // =================

  isNextDisabled() {
    return listOfWeeks[currentWeekIndex].last.isBefore(DateTime.now());
  }

  isCurrentYear() {
    return DateFormat('yyyy').format(currentWeek[0]) ==
        DateFormat('yyyy').format(today!);
  }


  @override
  Widget build(BuildContext context) {
    today = widget.todayDate;
    selectedDate = widget.datePickChange;
    if (today != selectedDate) {
      for (int ind = 0; ind < listOfWeeks.length; ind++) {
        for (int weekIndex = 0;
        weekIndex < listOfWeeks[ind].length;
        weekIndex++) {
          if (selectedDate == listOfWeeks[ind][weekIndex]) {
            log("CHECK : ${ind}");
            carouselController.jumpToPage(ind);
          }
        }
      }
      // carouselController.jumpToPage(page);
    }
    var theme = Theme.of(context);
    var theme1 =
    appCss.dmDenseMedium12.textColor(appColor(context).appTheme.rulesClr);
    var withOfScreen = MediaQuery
        .of(context)
        .size
        .width;

    double boxHeight = withOfScreen / 7;
    log("DATEE : $selectedDate");
    return currentWeek.isEmpty
        ? const SizedBox()
        : Column(children: [
      const SizedBox(height: 12),
      CarouselSlider(
          carouselController: carouselController,
          items: [
            if (listOfWeeks.isNotEmpty)
              for (int ind = 0; ind < listOfWeeks.length; ind++)
                Container(
                    decoration: BoxDecoration(
                        color: appColor(context).appTheme.whiteColor),
                    margin: const EdgeInsetsDirectional.only(bottom: 10),
                    height: boxHeight,
                    width: withOfScreen,
                    child: Row(children: [
                      GestureDetector(
                          onTap: () {
                            onBackClick();
                          },
                          child: SvgPicture.asset(
                              "assets/svg/liftarrow.svg")),
                      for (int weekIndex = 0;
                      weekIndex < listOfWeeks[ind].length;
                      weekIndex++)
                        Expanded(
                            child: GestureDetector(
                                onTap: listOfWeeks[ind][weekIndex]
                                    .isBefore(DateTime.now())
                                    ? () {
                                  onDateSelect(
                                      listOfWeeks[ind][weekIndex]);
                                }
                                    : null,
                                child: Container(
                                    height: Sizes.s52,
                                    width: Sizes.s38,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color(0x19000000),
                                              blurRadius: 2,
                                              offset: Offset(0, 2),
                                              spreadRadius: 0)
                                        ],
                                        borderRadius:
                                        BorderRadius.circular(6),
                                        color: DateFormat('dd-MM-yyyy')
                                            .format(listOfWeeks[ind]
                                        [weekIndex]) ==
                                            DateFormat('dd-MM-yyyy')
                                                .format(selectedDate!)
                                            ? widget.activeBackgroundColor ??
                                            theme.primaryColor
                                            : listOfWeeks[ind][weekIndex]
                                            .isBefore(
                                            DateTime.now())
                                            ? widget.inactiveBackgroundColor ??
                                            theme.primaryColor
                                                .withOpacity(.2)
                                            : widget.disabledBackgroundColor ??
                                            appColor(context).appTheme
                                                .whiteColor),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Text(
                                              DateFormat(
                                                'E',
                                              )
                                                  .format(listOfWeeks[ind]
                                              [weekIndex])
                                                  .substring(0, 2),
                                              textAlign: TextAlign.center,
                                              style: theme1.copyWith(
                                                  color: DateFormat(
                                                      'dd-MM-yyyy').format(
                                                      listOfWeeks[ind]
                                                      [weekIndex]) ==
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(
                                                          selectedDate!)
                                                      ? widget
                                                      .activeTextColor ??
                                                      Colors.white
                                                      : listOfWeeks[ind][weekIndex]
                                                      .isBefore(
                                                      DateTime.now())
                                                      ? widget
                                                      .inactiveWeekColor ??
                                                      Colors.white
                                                          .withOpacity(
                                                          .2)
                                                      : widget
                                                      .inactiveWeekColor ??
                                                      Colors.white)),
                                          const SizedBox(height: 4),
                                          FittedBox(
                                              child: Text(
                                                  "${listOfWeeks[ind][weekIndex]
                                                      .day}",
                                                  textAlign: TextAlign.center,
                                                  style: theme1.copyWith(
                                                      color: DateFormat(
                                                          'dd-MM-yyyy').format(
                                                          listOfWeeks[ind][weekIndex]) ==
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .format(
                                                              selectedDate!)
                                                          ? widget
                                                          .activeTextColor ??
                                                          Colors.white
                                                          : listOfWeeks[ind][weekIndex]
                                                          .isBefore(
                                                          DateTime
                                                              .now())
                                                          ? widget
                                                          .inactiveDateColor ??
                                                          Colors.white
                                                              .withOpacity(
                                                              .2)
                                                          : widget
                                                          .disabledTextColor ??
                                                          Colors
                                                              .white,
                                                      fontWeight:
                                                      FontWeight.bold)))
                                        ])))),
                      GestureDetector(
                          onTap: isNextDisabled()
                              ? () {
                            onNextClick();
                          }
                              : null,
                          child: SvgPicture.asset(
                              "assets/svg/rightArrow.svg"))
                    ]).paddingSymmetric(horizontal: 8))
          ],
          options: CarouselOptions(
              scrollPhysics: const ClampingScrollPhysics(),
              height: boxHeight,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              reverse: true,
              onPageChanged: (index, reason) {
                log("CCCC : $index");
                onWeekChange(index);
              }))
    ]);
  }
}
