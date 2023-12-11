import '../../../config.dart';
import 'package:bhakti_app/widgets/common_app_bar.dart';
import 'package:bhakti_app/widgets/common_container_tile.dart';
import 'package:bhakti_app/widgets/common_left_side_text.dart';
import 'package:bhakti_app/screens/home_screen/monitoring_screen/layouts/common_chanting_row.dart';

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<MonitoringProvider, BottomNavProvider>(
        builder: (context1, monitoringPvr, bottomNavPvr, child) {
      return SafeArea(
          child: Scaffold(
              extendBodyBehindAppBar: true,
              extendBody: true,
              body: Stack(alignment: Alignment.topCenter, children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(eImageAssets.splashBg)))),
                SingleChildScrollView(
                    child: Column(children: [
                  CommonAppBar(
                      onTap: () => monitoringPvr
                          .tabControl(bottomNavPvr.tabController!.index),
                      text: "Group View",
                      hSpace: Insets.i90),
                  const VSpace(Insets.i25),
                  const WeekCalendar(),
                  const VSpace(Insets.i25),
                  const CommonLeftSideText(text: "User Section"),
                  const VSpace(Insets.i15),
                  SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            bool isSelected =
                                index == monitoringPvr.selectedIndex;
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
                                monitoringPvr.isAllSelected = true;
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
                                monitoringPvr.isAllSelected = false;
                                setState(() {});
                              });
                            }
                          })),
                  const VSpace(Insets.i25),
                  monitoringPvr.isAllSelected == true
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
                          const CommonLeftSideText(text: "Sleep"),
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
                                      GroupViewSleepCommonContainer(
                                          text: 'Slept time',
                                          timeText: '10:30 PM',
                                          svgImage: eSvgAssets.sleptTime),
                                      const HSpace(Insets.i36),
                                      SvgPicture.asset(eSvgAssets.verticalLine),
                                      const HSpace(Insets.i20),
                                      GroupViewSleepCommonContainer(
                                          text: 'Woke time',
                                          timeText: '05:30 AM',
                                          svgImage: eSvgAssets.wokeTime)
                                    ]).marginSymmetric(horizontal: 15),
                                    const VSpace(Insets.i10),
                                    SvgPicture.asset(eSvgAssets.lineRuler),
                                    const VSpace(Insets.i10),
                                    Text("Duration : 8 Hours",
                                        style: appCss.dmDenseMedium16.textColor(
                                            appColor(context).appTheme.primary))
                                  ])),
                          const VSpace(Insets.i25),
                          const CommonLeftSideText(text: "Chanting"),
                          const VSpace(Insets.i15),
                          CommonContainerTile(
                              paddingArea:
                                  const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const CommonChantingRow(
                                        countOne: '1',
                                        countTwo: '2',
                                        textOne: 'Before 6:30 am',
                                        textTwo: 'Before 8:30 am'),
                                    const VSpace(Insets.i10),
                                    SvgPicture.asset(eSvgAssets.lineRuler),
                                    const VSpace(Insets.i10),
                                    const CommonChantingRow(
                                        countOne: '3',
                                        countTwo: '4',
                                        textOne: 'Before 10:00 am',
                                        textTwo: 'Before 11:30 am')
                                  ])),
                          const VSpace(Insets.i25),
                          const CommonLeftSideText(text: "Worship"),
                          const VSpace(Insets.i15),
                          CommonContainerTile(
                              paddingArea: const EdgeInsets.all(15),
                              child: Column(
                                  children: appArray.worshipUserList
                                      .asMap()
                                      .entries
                                      .map((e) {
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
                                  ]),
                                  if (e.key != e.value!.length)
                                    SvgPicture.asset(eSvgAssets.lineRuler)
                                        .paddingOnly(top: 10, bottom: 10)
                                ]);
                              }).toList())),
                          const VSpace(Insets.i25),
                          const CommonLeftSideText(text: "Knowledge"),
                          const VSpace(Insets.i15),
                          CommonContainerTile(
                              paddingArea: const EdgeInsets.all(15),
                              child: Column(children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Preaching : ",
                                          style: appCss.dmDenseMedium14
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .rulesClr)),
                                      Text("1:30",
                                          style: appCss.dmDenseMedium14
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .lightText)),
                                      const HSpace(Insets.i20),
                                      SvgPicture.asset(eSvgAssets.verticalLine,
                                          height: 30),
                                      const HSpace(Insets.i20),
                                      Text("Class : ",
                                          style: appCss.dmDenseMedium14
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .rulesClr)),
                                      Text("00:45",
                                          style: appCss.dmDenseMedium14
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .lightText))
                                    ]),
                                const VSpace(Insets.i10),
                                SvgPicture.asset(eSvgAssets.lineRuler),
                                const VSpace(Insets.i10),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Other KC Services : ",
                                          style: appCss.dmDenseMedium14
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .rulesClr)),
                                      Text("2:00",
                                          style: appCss.dmDenseMedium14
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .lightText))
                                    ])
                              ])),
                          const VSpace(Insets.i15)
                        ]))
                ]).paddingSymmetric(horizontal: Insets.i20))
              ])));
    });
  }
}
