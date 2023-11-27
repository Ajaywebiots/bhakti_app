import 'package:bhakti_app/screens/home_screen/layouts/list_model.dart';
import 'package:bhakti_app/screens/home_screen/monitoring_screen/layouts/user_view_layout/group_view_chanting_common_container.dart';
import 'package:bhakti_app/screens/home_screen/monitoring_screen/layouts/user_view_layout/group_view_sleep_common_container.dart';
import 'package:bhakti_app/screens/home_screen/monitoring_screen/layouts/all_user_layout/knowledge_group_layout.dart';
import 'package:bhakti_app/screens/home_screen/monitoring_screen/layouts/all_user_layout/prasadam_group_layout.dart';
import 'package:bhakti_app/screens/home_screen/monitoring_screen/layouts/all_user_layout/sleep_group_layout.dart';
import 'package:bhakti_app/screens/home_screen/monitoring_screen/layouts/user_todo_slider.dart';
import 'package:bhakti_app/screens/home_screen/monitoring_screen/layouts/all_user_layout/worship_group_layout.dart';
import '../../../providers/bottom_nav_provider.dart';
import '/common/assets/index.dart';
import '/common/extension/spacing.dart';
import '/common/extension/text_style_extensions.dart';
import '/common/extension/widget_extension.dart';
import '/config.dart';
import '/screens/home_screen/layouts/week_calendar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/providers/monitoring_provider.dart';
import 'layouts/all_user_layout/chanting_group_layout.dart';

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  bool isAllSelected = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<MonitoringProvider>(
        builder: (context1, monitoringPvr, child) {
      final dashPvr = Provider.of<BottomNavProvider>(context, listen: true);
      return SafeArea(
          child: Scaffold(
              extendBodyBehindAppBar: true,
              extendBody: true,
              // appBar: AppBar(
              //     leading: Container(),
              //     backgroundColor: Colors.transparent,
              //     titleSpacing: 0,
              //     leadingWidth: 0,
              //     title: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           const HSpace(Insets.i20),
              //           SvgPicture.asset("assets/svg/arrowLeft.svg").inkWell(
              //               onTap: () {
              //             dashPvr.tabController!.index = 0;
              //             dashPvr.notifyListeners();
              //           }),
              //           const HSpace(Insets.i90),
              //           Text("Group View",
              //               style: appCss.philosopherBold28
              //                   .textColor(appColor(context).appTheme.oneText))
              //         ])),
              body: Stack(alignment: Alignment.topCenter, children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(eImageAssets.splashBg)))),
                SingleChildScrollView(
                    child: Column(children: [
                      AppBar(
                          leading: Container(),
                          backgroundColor: Colors.transparent,
                          titleSpacing: 0,
                          leadingWidth: 0,
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const HSpace(Insets.i20),
                                SvgPicture.asset("assets/svg/arrowLeft.svg").inkWell(
                                    onTap: () {
                                      dashPvr.tabController!.index = 0;
                                      dashPvr.notifyListeners();
                                    }),
                                const HSpace(Insets.i90),
                                Text("Group View",
                                    style: appCss.philosopherBold28
                                        .textColor(appColor(context).appTheme.oneText))
                              ])),
                  const VSpace(Insets.i80),
                  const WeekCalendar(),
                  const VSpace(Insets.i25),
                  Row(children: [
                    Text("User Section",
                        style: appCss.philosopherBold18
                            .textColor(appColor(context).appTheme.rulesClr))
                  ]),
                  const VSpace(Insets.i15),
                  SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Container(
                                      width: 43,
                                      height: 43,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: appColor(context)
                                              .appTheme
                                              .primary),
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(right: 15),
                                      child: Text("All",
                                          style: appCss.dmDenseMedium12
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .whiteColor)))
                                  .inkWell(onTap: () {
                                isAllSelected = true;
                                setState(() {});
                              });
                            } else {
                              return Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      child: Image.asset(
                                          height: 43,
                                          width: 43,
                                          "assets/images/userSection.png"))
                                  .inkWell(onTap: () {
                                isAllSelected = false;
                                setState(() {});
                              });
                            }
                          })),
                  const VSpace(Insets.i25),
                  isAllSelected == true
                      ? Column(children: [
                          Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0x0F000000),
                                        blurRadius: 16,
                                        offset: Offset(0, 2))
                                  ]),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: monitoringPvr.userToDo.length,
                                  itemBuilder: (context, index) {
                                    return CommonPopInkwell(
                                        text: monitoringPvr.userToDo[index],
                                        onTap: () => monitoringPvr
                                            .selectedCategory(index),
                                        index: index,
                                        selectedIndex:
                                            monitoringPvr.isSelected);
                                  })),
                          const VSpace(Insets.i15),
                          Container(
                              child: monitoringPvr.isSelected == 0
                                  ? const SleepLayouts()
                                  : monitoringPvr.isSelected == 1
                                      ? const ChantingLayouts()
                                      : monitoringPvr.isSelected == 2
                                          ? const WorshipGroupLayout()
                                          : monitoringPvr.isSelected == 3
                                              ? const PrasadamGroupLayout()
                                              : const KnowledgeGroupLayout())
                        ])
                      : SingleChildScrollView(
                          child: Column(children: [
                          Row(children: [
                            Text("Sleep",
                                style: appCss.philosopherBold18.textColor(
                                    appColor(context).appTheme.rulesClr))
                          ]),
                          const VSpace(Insets.i15),
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Insets.i8),
                                  color: appColor(context).appTheme.whiteColor),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(children: [
                                      const GroupViewSleepCommonContainer(
                                          text: 'Slept time',
                                          timeText: '10:30 PM',
                                          svgImage: 'assets/svg/sleptTime.svg'),
                                      const HSpace(Insets.i28),
                                      SvgPicture.asset(
                                          "assets/svg/verticalLine.svg"),
                                      const HSpace(Insets.i20),
                                      const GroupViewSleepCommonContainer(
                                          text: 'Woke time',
                                          timeText: '05:30 AM',
                                          svgImage: 'assets/svg/wokeTime.svg'),
                                    ]).marginSymmetric(horizontal: 15),
                                    const VSpace(Insets.i10),
                                    SvgPicture.asset(eSvgAssets.lineRuler),
                                    const VSpace(Insets.i10),
                                    Text("Duration :8 Hours",
                                        style: appCss.dmDenseMedium16.textColor(
                                            appColor(context).appTheme.primary))
                                  ])),
                          const VSpace(Insets.i25),
                          Row(children: [
                            Text("Chanting",
                                style: appCss.philosopherBold18.textColor(
                                    appColor(context).appTheme.rulesClr))
                          ]),
                          const VSpace(Insets.i15),
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Insets.i8),
                                  color: appColor(context).appTheme.whiteColor),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const HSpace(Insets.i15),
                                          GroupViewChantingCommonContainer(
                                              text: 'Before 6:30 am',
                                              countText: '1',
                                              svgImage: eSvgAssets.chanting),
                                          const HSpace(Insets.i28),
                                          SvgPicture.asset(
                                              "assets/svg/verticalLine.svg"),
                                          const HSpace(Insets.i20),
                                          GroupViewChantingCommonContainer(
                                              text: 'Before 8:30 am',
                                              countText: '2',
                                              svgImage: eSvgAssets.chanting),
                                        ]),
                                    const VSpace(Insets.i10),
                                    SvgPicture.asset(eSvgAssets.lineRuler),
                                    const VSpace(Insets.i10),
                                    Row(children: [
                                      const HSpace(Insets.i15),
                                      GroupViewChantingCommonContainer(
                                          text: 'Before 10:00 am',
                                          countText: '3',
                                          svgImage: eSvgAssets.chanting),
                                      const HSpace(Insets.i28),
                                      SvgPicture.asset(
                                          "assets/svg/verticalLine.svg"),
                                      const HSpace(Insets.i20),
                                      GroupViewChantingCommonContainer(
                                          text: 'Before 11:30 am',
                                          countText: '4',
                                          svgImage: eSvgAssets.chanting)
                                    ])
                                  ])),
                          const VSpace(Insets.i25),
                          Row(children: [
                            Text("Worship",
                                style: appCss.philosopherBold18.textColor(
                                    appColor(context).appTheme.rulesClr)),
                          ]),
                          const VSpace(Insets.i15),
                          Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: appColor(context).appTheme.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: appColor(context)
                                            .appTheme
                                            .shadowClr,
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                        spreadRadius: 0)
                                  ]),
                              child: Column(
                                  children:
                                      worshipUserList.asMap().entries.map((e) {
                                return Column(children: [
                                  Row(children: [
                                    SvgPicture.asset(e.value['svgImage']),
                                    const HSpace(Insets.i10),
                                    Text(e.value['title'],
                                        style: appCss.dmDenseMedium16.textColor(
                                            appColor(context)
                                                .appTheme
                                                .primary)),
                                    const HSpace(Insets.i10),
                                    Text(e.value['data'],
                                        style: appCss.dmDenseMedium14.textColor(
                                            appColor(context)
                                                .appTheme
                                                .lightText))
                                  ])
                                ]);
                              }).toList())),
                          const VSpace(Insets.i25),
                          Row(children: [
                            Text("Presadam",
                                style: appCss.philosopherBold18.textColor(
                                    appColor(context).appTheme.rulesClr))
                          ]),
                          const VSpace(Insets.i15),
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: appColor(context).appTheme.whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          appColor(context).appTheme.shadowClr,
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                      spreadRadius: 0)
                                ]),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Text("Breakfast : ",
                                  style: appCss.dmDenseMedium14.textColor(
                                      appColor(context).appTheme.rulesClr)),
                              Text("Yes",
                                  style: appCss.dmDenseMedium14.textColor(
                                      appColor(context).appTheme.lightText)),
                              HSpace(Insets.i30),
                              Text("Lunch : ",
                                  style: appCss.dmDenseMedium14.textColor(
                                      appColor(context).appTheme.rulesClr)),
                              Text("No",
                                  style: appCss.dmDenseMedium14.textColor(
                                      appColor(context).appTheme.lightText)),
                              HSpace(Insets.i30),
                              Text("Dinner : ",
                                  style: appCss.dmDenseMedium14.textColor(
                                      appColor(context).appTheme.rulesClr)),
                              Text("No",
                                  style: appCss.dmDenseMedium14.textColor(
                                      appColor(context).appTheme.lightText)),
                            ]),
                          ),
                          const VSpace(Insets.i25),
                          Row(children: [
                            Text("Knowledge",
                                style: appCss.philosopherBold18.textColor(
                                    appColor(context).appTheme.rulesClr))
                          ]),
                          const VSpace(Insets.i15),
                        ]))
                ]).paddingSymmetric(horizontal: Insets.i20))
              ])));
    });
  }
}
