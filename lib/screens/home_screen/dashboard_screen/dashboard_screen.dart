import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/bottom_nav_provider.dart';
import 'package:bhakti_app/providers/dashboard_provider.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/extension/spacing.dart';

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
                        .inkWell(onTap: () {
                      dashPvr.tabController!.index = 0;
                      dashPvr.notifyListeners();
                    }),
                    const HSpace(Insets.i90),
                    Text("Dashboard",
                        style: appCss.philosopherBold28
                            .textColor(appColor(context).appTheme.oneText))
                  ])),
              body: Stack(alignment: Alignment.center, children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(eImageAssets.splashBg)))),

              ])));
    });
  }
}
