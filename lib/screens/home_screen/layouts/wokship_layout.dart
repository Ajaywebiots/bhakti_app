import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_container.dart';
import 'package:bhakti_app/providers/home_screen_provider/home_screen_provider.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_circle_design_layout.dart';

class WorshipLayout extends StatelessWidget {
  const WorshipLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, homeScreenPvr, child) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Stack(children: [
                CommonContainer(
                    onTap: () => homeScreenPvr.onManglaArtiSelect(context),
                    text: appFonts.mangalaArti,
                    timeText: '10:30 AM',
                    status: false,
                    onToggle: (val) {},
                    svgImage: eSvgAssets.mangalaAarti),
                const Positioned(
                    right: 58,
                    top: 11,
                    child:
                        CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
                const Positioned(
                    right: 21,
                    top: 4,
                    child: CommonCircleDesign(
                        height: Sizes.s10, width: Sizes.s10)),
                const Positioned(
                    left: 70,
                    bottom: 36,
                    child:
                        CommonCircleDesign(height: Sizes.s10, width: Sizes.s10))
              ])),
              const HSpace(Insets.i15),
              Expanded(
                  child: Stack(children: [
                CommonContainer(
                    text: appFonts.sandhyaArti,
                    timeText: '',
                    onTap: () {
                      homeScreenPvr.isSandhyaArti =
                          !homeScreenPvr.isSandhyaArti;
                      if (homeScreenPvr.isSandhyaArti == true) {
                        homeScreenPvr.onSandhyaArtiSelect(context);
                      }
                    },
                    onToggle: (value) {
                      homeScreenPvr.isSandhyaArti =
                          !homeScreenPvr.isSandhyaArti;
                      if (homeScreenPvr.isSandhyaArti == true) {
                        homeScreenPvr.onSandhyaArtiSelect(context);
                      }
                    },
                    status: homeScreenPvr.isSandhyaArti,
                    svgImage: eSvgAssets.sandhyaArti),
                const Positioned(
                    right: 58,
                    top: 11,
                    child:
                        CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
                const Positioned(
                    right: 27,
                    top: 5,
                    child: CommonCircleDesign(
                        height: Sizes.s10, width: Sizes.s10)),
                const Positioned(
                    right: 10,
                    bottom: 9,
                    child: CommonCircleDesign(
                        height: Sizes.s10, width: Sizes.s10)),
                const Positioned(
                    left: 70,
                    bottom: 36,
                    child:
                        CommonCircleDesign(height: Sizes.s10, width: Sizes.s10))
              ]))
            ]);
      },
    );
  }
}
