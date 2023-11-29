
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/bottom_nav_provider.dart';
import 'package:bhakti_app/providers/dashboard_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiffy/jiffy.dart';

import 'package:table_calendar/table_calendar.dart';
import '../../../common/extension/spacing.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
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
      setState(() {
        selectedDay = selectDay;
        focusedDay = focusDay;
      });
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
    setState(() {
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
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (context1, dashboardPvr, child) {
      final dashPvr = Provider.of<BottomNavProvider>(context, listen: true);
      return SafeArea(
          child: Scaffold(
              extendBodyBehindAppBar: true,
              extendBody: true,
              body: Stack(alignment: Alignment.center, children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(eImageAssets.splashBg)))),
                SingleChildScrollView(
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    AppBar(
                        leading: Container(),
                        backgroundColor: Colors.transparent,
                        titleSpacing: 0,
                        leadingWidth: 0,
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset("assets/svg/arrowLeft.svg")
                                  .inkWell(onTap: () {
                                dashPvr.tabController!.index = 0;
                                dashPvr.notifyListeners();
                              }),
                              const HSpace(Insets.i90),
                              Text("Dashboard",
                                  style: appCss.philosopherBold28.textColor(
                                      appColor(context).appTheme.oneText))
                            ])),
                    const VSpace(Insets.i25),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: appColor(context).appTheme.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: appColor(context).appTheme.shadowClr,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                  spreadRadius: 0)
                            ]),
                        child: ExpansionTile(
                            onExpansionChanged: (value) {
                              setState(() {
                                onChange = !onChange;
                              });
                            },
                            trailing: SvgPicture.asset(onChange == false
                                ? eSvgAssets.arrowDown1
                                : eSvgAssets.arrowUp),
                            leading:
                                SvgPicture.asset("assets/svg/calendarEdit.svg"),
                            title: Text(
                                "${startedRange ?? "Select From Date"} ${startedRange == null ? "And" : "to"} ${endedRange ?? "To Date"}",
                                style: appCss.dmDenseMedium16.textColor(
                                    appColor(context).appTheme.primary)),
                            children: <Widget>[
                              TableCalendar(
                                  onFormatChanged: (format) {
                                    if (calendarFormat != format) {
                                      setState(() {
                                        calendarFormat = format;
                                      });
                                    }
                                  },
                                  rangeStartDay: rangeStart,
                                  rangeEndDay: rangeEnd,
                                  onRangeSelected: (start, end, focusedDay) =>
                                      onRangeSelected(start, end, focusedDay),
                                  rangeSelectionMode:
                                      RangeSelectionMode.toggledOn,
                                  calendarStyle: CalendarStyle(
                                      isTodayHighlighted: false,
                                      rangeHighlightColor: appColor(context)
                                          .appTheme
                                          .primary
                                          .withOpacity(0.10),
                                      rangeEndDecoration: BoxDecoration(
                                          color: appColor(context)
                                              .appTheme
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      rangeStartDecoration: BoxDecoration(
                                          color: appColor(context)
                                              .appTheme
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      selectedDecoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(1))),
                                  headerStyle: HeaderStyle(
                                      titleTextStyle: appCss.dmDenseMedium14.textColor(appColor(context).appTheme.primary),
                                      rightChevronVisible: true,
                                      rightChevronIcon: Container(padding: const EdgeInsets.all(6), height: 26, width: 26, decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: appColor(context).appTheme.primary.withOpacity(0.10)), child: SvgPicture.asset("assets/svg/rightSide.svg")),
                                      leftChevronIcon: Container(padding: const EdgeInsets.all(6), height: 26, width: 26, decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: appColor(context).appTheme.primary.withOpacity(0.10)), child: SvgPicture.asset("assets/svg/leftSide.svg")),
                                      leftChevronMargin: const EdgeInsets.only(left: 50),
                                      rightChevronMargin: const EdgeInsets.only(right: 50),
                                      formatButtonVisible: false,
                                      titleCentered: true),
                                  firstDay: DateTime.utc(2010, 10, 16),
                                  lastDay: DateTime.utc(2030, 3, 14),
                                  focusedDay: DateTime.now(),
                                  onDaySelected: (selectedDay, focusedDay) {
                                    setState(() {
                                      selectedDay = selectedDay;
                                      focusedDay = focusedDay;
                                    });
                                  },
                                  onPageChanged: (focusedDay) {
                                    setState(() {
                                      focusedDay = focusedDay;
                                    });
                                  }),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: appColor(context)
                                                        .appTheme
                                                        .primary),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            height: 44,
                                            width: 120,
                                            child: Text("Cancel",
                                                style: appCss.dmDenseMedium16
                                                    .textColor(appColor(context)
                                                        .appTheme
                                                        .primary)))
                                        .inkWell(onTap: () {}),
                                    const HSpace(Insets.i15),
                                    Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: appColor(context)
                                                    .appTheme
                                                    .primary),
                                            height: 44,
                                            width: 120,
                                            child: Text("Save",
                                                style: appCss.dmDenseMedium16
                                                    .textColor(appColor(context)
                                                        .appTheme
                                                        .whiteColor)))
                                        .inkWell(onTap: () {})
                                  ]).marginSymmetric(vertical: Insets.i20),
                              // WheelSlider(
                              //   horizontalListWidth: 300,
                              //   customPointer:
                              //       SvgPicture.asset("assets/svg/ruler.svg")
                              //           .paddingOnly(top: 40),
                              //   totalCount: totalCount,
                              //   initValue: initValue,
                              //   onValueChanged: (val) {
                              //     setState(() {
                              //       currentValue = val;
                              //     });
                              //      log("currentValue");
                              //   },
                              // ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "${currentValue.toString()}",
                              //       style: const TextStyle(
                              //           fontSize: 18,
                              //           height: 2.0,
                              //           fontWeight: FontWeight.w500),
                              //     ),
                              //     Text(
                              //       "${currentValue.toString()}",
                              //       style: const TextStyle(
                              //           fontSize: 18,
                              //           height: 2.0,
                              //           fontWeight: FontWeight.w500),
                              //     ),
                              //     Text(
                              //       "${currentValue.toString()}",
                              //       style: const TextStyle(
                              //           fontSize: 18,
                              //           height: 2.0,
                              //           fontWeight: FontWeight.w500),
                              //     ),
                              //   ],
                              // )
                            ])),
                    const VSpace(Insets.i25),
                    Row(children: [
                      Text("User Section",
                          style: appCss.philosopherBold18
                              .textColor(appColor(context).appTheme.rulesClr))
                    ]),
                    const VSpace(Insets.i25),
                    SizedBox(
                        height: 70,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              bool isSelected = index == selectedIndex;
                              return Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  child: Column(children: [
                                    Opacity(
                                        opacity: isSelected ? 1.0 : 0.8,
                                        child: Image.asset(
                                            height: isSelected ? 50 : 43,
                                            width: isSelected ? 50 : 43,
                                            "assets/images/userSection.png")),
                                    if (isSelected) Text(names[index])
                                  ])).inkWell(onTap: () {
                                setState(() {
                                  selectedIndex = isSelected ? -1 : index;
                                });
                              });
                            })),
                    const VSpace(Insets.i5),
                    Row(children: [
                      Text("Sleep Chart",
                          style: appCss.philosopherBold18
                              .textColor(appColor(context).appTheme.rulesClr))
                    ]),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: appColor(context).appTheme.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: appColor(context).appTheme.shadowClr,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                                spreadRadius: 0)
                          ]),
                    ),
                    Row(children: [
                      Text("Chanting Rounds Chart",
                          style: appCss.philosopherBold18
                              .textColor(appColor(context).appTheme.rulesClr))
                    ]),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: appColor(context).appTheme.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: appColor(context).appTheme.shadowClr,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                                spreadRadius: 0)
                          ]),
                    ),
                    Row(children: [
                      Text("Knowledge Chart",
                          style: appCss.philosopherBold18
                              .textColor(appColor(context).appTheme.rulesClr))
                    ]),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: appColor(context).appTheme.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: appColor(context).appTheme.shadowClr,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                                spreadRadius: 0)
                          ]),
                    )
                  ]).paddingSymmetric(horizontal: Insets.i20),
                )
              ])));
    });
  }
}
