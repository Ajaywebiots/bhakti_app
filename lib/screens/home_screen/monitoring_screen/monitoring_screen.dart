import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/layouts/week_calendar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../providers/monitoring_provider.dart';

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MonitoringProvider>(
        builder: (context1, dashboardPvr, child) {
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
              body: Stack(alignment: Alignment.center, children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(eImageAssets.splashBg)))),
                SingleChildScrollView(
                    child: Column(children: [
                  const WeekCalendar(),
                  const HSpace(Insets.i20),
                  Row(children: [
                    Text("User Section",
                        style: appCss.dmDenseExtraBold18
                            .textColor(appColor(context).appTheme.rulesClr))
                  ]),
                  Container(
                      height: 40,
                      child: Image.asset("assets/images/userSection.png"))
                ]).paddingSymmetric(horizontal: Insets.i20))
              ])));
    });
  }
}
