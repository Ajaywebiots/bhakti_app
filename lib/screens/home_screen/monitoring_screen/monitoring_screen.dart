import '../../../config.dart';

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
                      text: appFonts.groupView,
                      hSpace: Insets.i65),
                  const VSpace(Insets.i25),
                  const WeekCalendar(),
                  const VSpace(Insets.i25),
                  CommonLeftSideText(text: appFonts.userSection),
                  const VSpace(Insets.i15),
                  const MonitoringGroupUpperLayout(),
                  const VSpace(Insets.i25),
                  monitoringPvr.isAllSelected == true
                      ? const MonitoringAllUserLayout()
                      : const MonitoringSingleUserLayout()
                ]).paddingSymmetric(horizontal: Insets.i20))
              ])));
    });
  }
}
