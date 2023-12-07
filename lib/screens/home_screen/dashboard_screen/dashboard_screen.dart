import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/bottom_nav_provider.dart';
import 'package:bhakti_app/providers/dashboard_provider.dart';
import 'package:bhakti_app/screens/home_screen/dashboard_screen/layouts/association_chart.dart';
import 'package:bhakti_app/screens/home_screen/dashboard_screen/layouts/chanting_chart.dart';
import 'package:bhakti_app/screens/home_screen/dashboard_screen/layouts/common_container_design.dart';
import 'package:bhakti_app/screens/home_screen/dashboard_screen/layouts/sleep_pattern_chart.dart';
import 'package:bhakti_app/widgets/stateful_wrapper.dart';
import 'package:table_calendar/table_calendar.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (context1, dashboardPvr, child) {
      final dashPvr = Provider.of<BottomNavProvider>(context, listen: true);
      return StatefulWrapper(
          onInit: () => Future.delayed(DurationsClass.ms150)
              .then((value) => dashboardPvr.onInit(context)),
          child: SafeArea(
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
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          AppBar(
                              leading: Container(),
                              backgroundColor: Colors.transparent,
                              titleSpacing: 0,
                              leadingWidth: Sizes.s0,
                              title: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset("assets/svg/arrowLeft.svg")
                                        .inkWell(onTap: () {
                                      dashPvr.tabController!.index = 0;
                                      dashPvr.notifyListeners();
                                    }),
                                    const HSpace(Insets.i90),
                                    Text(appFonts.dashboard,
                                        style: appCss.philosopherBold28
                                            .textColor(appColor(context)
                                                .appTheme
                                                .oneText))
                                  ])),
                          const VSpace(Insets.i25),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: appColor(context).appTheme.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: appColor(context)
                                            .appTheme
                                            .shadowClr,
                                        blurRadius: 16,
                                        offset: const Offset(0, 2),
                                        spreadRadius: 0)
                                  ]),
                              child: ExpansionTile(
                                  onExpansionChanged: (value) {
                                    setState(() {
                                      dashboardPvr.onChange =
                                          !dashboardPvr.onChange;
                                    });
                                  },
                                  trailing: SvgPicture.asset(
                                      dashboardPvr.onChange == false
                                          ? eSvgAssets.arrowDown1
                                          : eSvgAssets.arrowUp),
                                  leading: SvgPicture.asset(
                                      "assets/svg/calendarEdit.svg"),
                                  title: Text(
                                      "${dashboardPvr.startedRange ?? appFonts.selectFromDate} ${dashboardPvr.startedRange == null ? appFonts.and : appFonts.to} ${dashboardPvr.endedRange ?? appFonts.toDate}",
                                      style: appCss.dmDenseMedium16.textColor(
                                          appColor(context).appTheme.primary)),
                                  children: <Widget>[
                                    TableCalendar(
                                        onFormatChanged: (format) {
                                          if (dashboardPvr.calendarFormat !=
                                              format) {
                                            setState(() {
                                              dashboardPvr.calendarFormat =
                                                  format;
                                            });
                                          }
                                        },
                                        rangeStartDay: dashboardPvr.rangeStart,
                                        rangeEndDay: dashboardPvr.rangeEnd,
                                        onRangeSelected: (start, end, focusedDay) =>
                                            dashboardPvr.onRangeSelected(
                                                start, end, focusedDay),
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
                                            selectedDecoration:
                                                BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(1))),
                                        headerStyle: HeaderStyle(titleTextStyle: appCss.dmDenseMedium14.textColor(appColor(context).appTheme.primary), rightChevronVisible: true, rightChevronIcon: Container(padding: const EdgeInsets.all(6), height: Sizes.s26, width: Sizes.s26, decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: appColor(context).appTheme.primary.withOpacity(0.10)), child: SvgPicture.asset("assets/svg/rightSide.svg")), leftChevronIcon: Container(padding: const EdgeInsets.all(6), height: Sizes.s26, width: Sizes.s26, decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: appColor(context).appTheme.primary.withOpacity(0.10)), child: SvgPicture.asset("assets/svg/leftSide.svg")), leftChevronMargin: const EdgeInsets.only(left: 50), rightChevronMargin: const EdgeInsets.only(right: 50), formatButtonVisible: false, titleCentered: true),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                          Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: Sizes.s1,
                                                          color:
                                                              appColor(context)
                                                                  .appTheme
                                                                  .primary),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  height: Sizes.s44,
                                                  width: Sizes.s120,
                                                  child: Text(appFonts.cancel,
                                                      style: appCss
                                                          .dmDenseMedium16
                                                          .textColor(
                                                              appColor(context)
                                                                  .appTheme
                                                                  .primary)))
                                              .inkWell(onTap: () {}),
                                          const HSpace(Insets.i15),
                                          Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: appColor(context)
                                                          .appTheme
                                                          .primary),
                                                  height: Sizes.s44,
                                                  width: Sizes.s120,
                                                  child: Text(appFonts.save,
                                                      style: appCss
                                                          .dmDenseMedium16
                                                          .textColor(
                                                              appColor(context)
                                                                  .appTheme
                                                                  .whiteColor)))
                                              .inkWell(onTap: () {})
                                        ])
                                        .marginSymmetric(vertical: Insets.i20),
                                  ])),
                          const VSpace(Insets.i25),
                          Row(children: [
                            Text(appFonts.userSection,
                                style: appCss.philosopherBold18.textColor(
                                    appColor(context).appTheme.rulesClr))
                          ]),
                          const VSpace(Insets.i25),
                          SizedBox(
                              height: Sizes.s70,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    bool isSelected =
                                        index == dashboardPvr.selectedIndex;
                                    return Container(
                                        margin:
                                            const EdgeInsets.only(right: 15),
                                        child: Column(children: [
                                          Opacity(
                                              opacity: isSelected ? 1.0 : 0.8,
                                              child: Image.asset(
                                                  height: isSelected
                                                      ? Sizes.s50
                                                      : Sizes.s43,
                                                  width: isSelected
                                                      ? Sizes.s50
                                                      : Sizes.s43,
                                                  "assets/images/userSection.png")),
                                          if (isSelected)
                                            Text(dashboardPvr.names[index])
                                        ])).inkWell(onTap: () {
                                      setState(() {
                                        dashboardPvr.selectedIndex =
                                            isSelected ? -1 : index;
                                      });
                                    });
                                  })),
                          const VSpace(Insets.i5),
                          Row(children: [
                            Text(appFonts.sleepPatternChart,
                                style: appCss.philosopherBold18.textColor(
                                    appColor(context).appTheme.rulesClr))
                          ]),
                          const CommonContainerDesign(
                              child: SleepPatternChart()),
                          Row(children: [
                            Text(appFonts.chantingChart,
                                style: appCss.philosopherBold18.textColor(
                                    appColor(context).appTheme.rulesClr))
                          ]),
                          const CommonContainerDesign(child: ChantingChart()),
                          Row(children: [
                            Text(appFonts.associationChart,
                                style: appCss.philosopherBold18.textColor(
                                    appColor(context).appTheme.rulesClr))
                          ]),
                          const CommonContainerDesign(
                              child: AssociationChart()),
                        ]).paddingSymmetric(horizontal: Insets.i20))
                  ]))));
    });
  }
}
