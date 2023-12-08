import 'package:bhakti_app/config.dart';

import '../../../../widgets/common_left_side_text.dart';

class HomeScreenUpperLayout extends StatelessWidget {
  const HomeScreenUpperLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const WeekCalendar(),
      const VSpace(Insets.i15),
      CommonLeftSideText(text: appFonts.sleep),
      const VSpace(Insets.i15),
      const SleepLayout(),
      const VSpace(Insets.i25),
      CommonLeftSideText(text: appFonts.worship),
      const VSpace(Insets.i15),
      const WorshipLayout(),
      const VSpace(Insets.i25),
      CommonLeftSideText(text: appFonts.chanting),
      const VSpace(Insets.i15),
      const Stack(alignment: Alignment.centerRight, children: [
        Align(alignment: Alignment.centerLeft, child: ChantingCommon())
      ]).width(double.infinity),
      const VSpace(Insets.i15)
    ]);
  }
}
