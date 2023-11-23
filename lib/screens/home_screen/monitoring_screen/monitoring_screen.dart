import 'package:bhakti_app/screens/home_screen/monitoring_screen/layouts/chanting_group_layout.dart';
import 'package:bhakti_app/screens/home_screen/monitoring_screen/layouts/knowledge_group_layout.dart';
import 'package:bhakti_app/screens/home_screen/monitoring_screen/layouts/prasadam_group_layout.dart';
import 'package:bhakti_app/screens/home_screen/monitoring_screen/layouts/sleep_group_layout.dart';
import 'package:bhakti_app/screens/home_screen/monitoring_screen/layouts/user_todo_slider.dart';
import 'package:bhakti_app/screens/home_screen/monitoring_screen/layouts/worship_group_layout.dart';
import 'package:data_table_2/data_table_2.dart';

import '/common/assets/index.dart';
import '/common/extension/spacing.dart';
import '/common/extension/text_style_extensions.dart';
import '/common/extension/widget_extension.dart';
import '/config.dart';
import '/screens/home_screen/layouts/week_calendar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/providers/monitoring_provider.dart';

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MonitoringProvider>(
        builder: (context1, monitoringPvr, child) {
      return SafeArea(
          child: Scaffold(
              extendBodyBehindAppBar: true,
              extendBody: true,
              appBar: AppBar(
                  leading: Container(),
                  backgroundColor: Colors.transparent,
                  titleSpacing: 0,
                  leadingWidth: 0,
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const HSpace(Insets.i20),
                        SvgPicture.asset("assets/svg/arrowLeft.svg")
                            .inkWell(onTap: () => Navigator.pop(context)),
                        const HSpace(Insets.i90),
                        Text("Group View",
                            style: appCss.philosopherBold28
                                .textColor(appColor(context).appTheme.oneText))
                      ])),
              body: Stack(alignment: Alignment.topCenter, children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(eImageAssets.splashBg)))),
                SingleChildScrollView(
                    child: Column(
                        children: [
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
                                      color:
                                          appColor(context).appTheme.primary),
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 15),
                                  child: Text("All",
                                      style: appCss.dmDenseMedium12.textColor(
                                          appColor(context)
                                              .appTheme
                                              .whiteColor)));
                            } else {
                              return Container(
                                margin: const EdgeInsets.only(right: 15),
                                child: Image.asset(height: 43,width: 43,
                                    "assets/images/userSection.png"),
                              );
                            }
                          })),
                  const VSpace(Insets.i25),
                  Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x0F000000),
                              blurRadius: 16,
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: monitoringPvr.userToDo.length,
                          itemBuilder: (context, index) {
                            return CommonPopInkwell(
                                text: monitoringPvr.userToDo[index],
                                onTap: () =>
                                    monitoringPvr.selectedCategory(index),
                                index: index,
                                selectedIndex: monitoringPvr.isSelected);
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
                ]).paddingSymmetric(horizontal: Insets.i20))
              ])));
    });
  }
}
