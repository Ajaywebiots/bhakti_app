import 'package:bhakti_app/config.dart';

class MonitoringChantingLayout extends StatelessWidget {
  const MonitoringChantingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CommonLeftSideText(text: appFonts.chanting),
      const VSpace(Insets.i15),
      CommonContainerTile(
          paddingArea: EdgeInsets.zero,
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CommonChantingRow(
                  countOne: appFonts.count, textOne: appFonts.beforeTime),
              SvgPicture.asset(eSvgAssets.verticalLine),
              CommonChantingRow(
                  countOne: appFonts.count1, textOne: appFonts.beforeTime1)
            ]).paddingSymmetric(horizontal: 10),
            SvgPicture.asset(eSvgAssets.lineRuler),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CommonChantingRow(
                  countOne: appFonts.count2, textOne: appFonts.beforeTime2),
              SvgPicture.asset(eSvgAssets.verticalLine),
              CommonChantingRow(
                  countOne: appFonts.count3, textOne: appFonts.beforeTime3)
            ]).paddingSymmetric(horizontal: 10)
          ]))
    ]);
  }
}
