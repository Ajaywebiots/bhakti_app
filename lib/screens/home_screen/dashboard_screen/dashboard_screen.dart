import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/dashboard_screen/layouts/chanting_chart.dart';
import 'package:bhakti_app/screens/home_screen/dashboard_screen/layouts/table_calendar.dart';
import 'package:bhakti_app/widgets/common_app_bar.dart';
import 'package:bhakti_app/widgets/common_bg_image.dart';
import 'package:bhakti_app/widgets/common_container_tile.dart';
import 'package:bhakti_app/widgets/common_left_side_text.dart';
import 'layouts/user_selection_layout.dart';

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
      return StatefulWrapper(
          onInit: () => Future.delayed(DurationsClass.ms150)
              .then((value) => dashboardPvr.onInit(context)),
          child: SafeArea(
              child: Scaffold(
                  extendBodyBehindAppBar: true,
                  extendBody: true,
                  body: CommonBgImage(
                      widget: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                        CommonAppBar(
                            text: appFonts.dashboard,
                            hSpace: Insets.i90,
                            onTap: () => dashboardPvr.tabController(context)),
                        const VSpace(Insets.i25),
                        const CommonContainerTile(child: TableCalendarLayout()),
                        const VSpace(Insets.i25),
                        CommonLeftSideText(text: appFonts.userSection),
                        const VSpace(Insets.i25),
                        SizedBox(
                            height: Sizes.s70,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 8,
                                itemBuilder: (context, index) {
                                  bool isSelected =
                                      index == dashboardPvr.selectedIndex;
                                  return UserSelectionLayout(
                                      isSelected: isSelected, index: index);
                                })),
                        CommonContainerDesign(
                            text: appFonts.sleepPatternChart,
                            child: const SleepPatternChart()),
                        CommonContainerDesign(
                            text: appFonts.chantingChart,
                            child: const ChantingChart()),
                        CommonContainerDesign(
                            text: appFonts.associationChart,
                            child: const AssociationChart())
                      ]).paddingSymmetric(horizontal: Insets.i20))))));
    });
  }
}
