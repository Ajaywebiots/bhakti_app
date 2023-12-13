import 'package:bhakti_app/config.dart';

class WorshipLayout extends StatelessWidget {
  const WorshipLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
            child: Stack(children: [
          CommonContainer(
              isToggle: true,
              onTap: () => homeScreenPvr.onManglaArtiSelect(context),
              text: appFonts.mangalaArti,
              timeText: homeScreenPvr.mangalaArtiTime,
              status: false,
              onToggle: (val) {},
              svgImage: eSvgAssets.mangalaAarti),
          const Positioned(
              right: 58,
              top: 11,
              child: CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
          const Positioned(
              right: 21,
              top: 4,
              child: CommonCircleDesign(height: Sizes.s10, width: Sizes.s10)),
          const Positioned(
              left: 70,
              bottom: 36,
              child: CommonCircleDesign(height: Sizes.s10, width: Sizes.s10))
        ])),
        const HSpace(Insets.i15),
        Expanded(
            child: Stack(children: [
          CommonContainer(
              text: appFonts.sandhyaArti,
              timeText: '',
              onTap: () {
                homeScreenPvr.isSandhyaArti = !homeScreenPvr.isSandhyaArti;
                if (homeScreenPvr.isSandhyaArti == true) {
                  homeScreenPvr.onSandhyaArtiSelect(context);
                }
                homeScreenPvr.notifyListeners();
              },
              onToggle: (value) {
                homeScreenPvr.isSandhyaArti = !homeScreenPvr.isSandhyaArti;
                if (homeScreenPvr.isSandhyaArti == true) {
                  homeScreenPvr.onSandhyaArtiSelect(context);
                }
                homeScreenPvr.notifyListeners();
              },
              status: homeScreenPvr.isSandhyaArti,
              svgImage: eSvgAssets.sandhyaArti),
          const Positioned(
              right: 58,
              top: 11,
              child: CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
          const Positioned(
              right: 27,
              top: 5,
              child: CommonCircleDesign(height: Sizes.s10, width: Sizes.s10)),
          const Positioned(
              right: 10,
              bottom: 9,
              child: CommonCircleDesign(height: Sizes.s10, width: Sizes.s10)),
          const Positioned(
              left: 70,
              bottom: 36,
              child: CommonCircleDesign(height: Sizes.s10, width: Sizes.s10))
        ]))
      ]);
    });
  }
}
