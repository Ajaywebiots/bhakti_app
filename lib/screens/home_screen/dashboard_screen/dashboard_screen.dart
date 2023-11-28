import 'dart:developer';

import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/bottom_nav_provider.dart';
import 'package:bhakti_app/providers/dashboard_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wheel_slider/wheel_slider.dart';
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
  String selectedDate = '';
  String dateCount = '';
  String range = '';
  String rangeCount = '';
  bool onChange = false;
  var initialDate = DateTime.now();
  var initialDateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  int currentValue = 1;
  final int _totalCount = 12;
  final int _initValue = 5;
  DateTime? selectedRangeStart;
  DateTime? selectedRangeEnd;

  void fetchAndDisplayEvents(DateTime start, DateTime end) {}

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
                Column(children: [
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
                          title: Text("1st Dec to 7th Dec 2022",
                              style: appCss.dmDenseMedium16.textColor(
                                  appColor(context).appTheme.primary)),
                          children: <Widget>[
                            TableCalendar(
                                calendarStyle: CalendarStyle(
                                    selectedDecoration: BoxDecoration(
                                        color:
                                            appColor(context).appTheme.primary,
                                        borderRadius:
                                            BorderRadius.circular(6))),
                                headerStyle: HeaderStyle(
                                    titleTextStyle: appCss.dmDenseMedium14.textColor(
                                        appColor(context).appTheme.primary),
                                    rightChevronVisible: true,
                                    rightChevronIcon: Container(
                                        padding: EdgeInsets.all(6),
                                        height: 26,
                                        width: 26,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: appColor(context)
                                                .appTheme
                                                .primary
                                                .withOpacity(0.10)),
                                        child: SvgPicture.asset(
                                            "assets/svg/rightSide.svg")),
                                    leftChevronIcon: Container(
                                        padding: EdgeInsets.all(6),
                                        height: 26,
                                        width: 26,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            color: appColor(context).appTheme.primary.withOpacity(0.10)),
                                        child: SvgPicture.asset("assets/svg/leftSide.svg")),
                                    leftChevronMargin: EdgeInsets.only(left: 50),
                                    rightChevronMargin: EdgeInsets.only(right: 50),
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
                                  focusedDay = focusedDay;
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
                                      .inkWell(onTap: () {
                                    Navigator.pop(context);
                                  }),
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
                                      .inkWell(onTap: () {
                                    Navigator.pop(context);
                                  })
                                ]).marginSymmetric(vertical: Insets.i20)

                            /*   WheelSlider(
                                horizontalListWidth: 300,
                                customPointer:
                                    SvgPicture.asset("assets/svg/ruler.svg")
                                        .paddingOnly(top: 40),
                                totalCount: _totalCount,
                                initValue: _initValue,
                                onValueChanged: (val) {
                                  setState(() {
                                    currentValue = val;
                                  });
                                }),
                            Text(currentValue.toString(),
                                style: const TextStyle(
                                    fontSize: 18,
                                    height: 2.0,
                                    fontWeight: FontWeight.w500))*/
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
                    Text("Sleep Pattern Chart",
                        style: appCss.philosopherBold18
                            .textColor(appColor(context).appTheme.rulesClr))
                  ]),
                  Row(children: [
                    Text("Chanting Chart",
                        style: appCss.philosopherBold18
                            .textColor(appColor(context).appTheme.rulesClr))
                  ]),
                  Row(children: [
                    Text("Association Chart",
                        style: appCss.philosopherBold18
                            .textColor(appColor(context).appTheme.rulesClr))
                  ])
                ]).paddingSymmetric(horizontal: Insets.i20)
              ])));
    });
  }
}
