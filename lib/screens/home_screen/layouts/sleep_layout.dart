import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/home_screen_provider.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_circle_design_layout.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_container.dart';

class SleepLayout extends StatelessWidget {
  const SleepLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, homeScreenPvr, child) {
        return Row(children: [
          Expanded(
              child: Stack(children: [
            CommonContainer(
                status: false,
                onTap: () => homeScreenPvr.onSleepTimeSelect(context),
                onToggle: (val) {},
                text: appFonts.sleptAt,
                timeText: homeScreenPvr.sleepAt,
                svgImage: eSvgAssets.sleptTimeIcon),
            const Positioned(
                left: 64,
                top: 7,
                child: CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
            const Positioned(
                left: 133,
                top: 54,
                child: CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
            const Positioned(
                left: 110,
                bottom: 9,
                child: CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
            const Positioned(
                left: 132,
                top: 3,
                child: CommonCircleDesign(height: Sizes.s10, width: Sizes.s10)),
            const Positioned(
                left: 142,
                top: 29,
                child: CommonCircleDesign(height: Sizes.s10, width: Sizes.s10)),
            const Positioned(
                left: 100,
                top: 52,
                child: CommonCircleDesign(height: Sizes.s10, width: Sizes.s10))
          ])),
          const HSpace(Insets.i15),
          Expanded(
              child: Stack(children: [
            // wokeup time select
            CommonContainer(
                onTap: () => homeScreenPvr.onWokeUpTimeSelect(context),
                status: false,
                onToggle: (val) {},
                text: appFonts.wokeUpAt,
                timeText: homeScreenPvr.wakeupTime,
                svgImage: eSvgAssets.wokeTime),
            const Positioned(
                right: 58,
                top: 11,
                child: CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
            const Positioned(
                right: 57,
                bottom: 26,
                child: CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
            const Positioned(
                right: 74,
                bottom: 9,
                child: CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
            const Positioned(
                right: 18,
                top: 13,
                child: CommonCircleDesign(height: Sizes.s10, width: Sizes.s10)),
            const Positioned(
                right: 4,
                top: 30,
                child: CommonCircleDesign(height: Sizes.s10, width: Sizes.s10)),
            const Positioned(
                left: 70,
                bottom: 36,
                child: CommonCircleDesign(height: Sizes.s10, width: Sizes.s10))
          ]))
        ]);
      },
    );
  }
}
