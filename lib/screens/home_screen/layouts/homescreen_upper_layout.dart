import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/layouts/sleep_layout.dart';
import 'package:bhakti_app/screens/home_screen/layouts/week_calendar.dart';
import 'package:bhakti_app/screens/home_screen/layouts/worship_layout.dart';

import '../../../common/extension/spacing.dart';
import 'chanting_common_layout.dart';

class HomeScreenUpperLayout extends StatelessWidget {
  const HomeScreenUpperLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      const WeekCalendar(),
      const VSpace(Insets.i15),
      Text(appFonts.sleep, style: appCss.philosopherBold18),
      const VSpace(Insets.i15),
      const SleepLayout(),
      const VSpace(Insets.i25),
      Text(appFonts.worship, style: appCss.philosopherBold18),
      const VSpace(Insets.i15),
      const WorshipLayout(),
      const VSpace(Insets.i25),
      Text(appFonts.chanting, style: appCss.philosopherBold18),
      const VSpace(Insets.i15),
      const Stack(alignment: Alignment.centerRight, children: [
        Align(alignment: Alignment.centerLeft, child: ChantingCommon())
      ]).width(double.infinity),
      const VSpace(Insets.i15)
    ]);
  }
}
