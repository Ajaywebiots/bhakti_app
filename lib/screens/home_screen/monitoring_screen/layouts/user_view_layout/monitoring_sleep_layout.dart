import '../../../../../config.dart';

class MonitoringSleepLayout extends StatelessWidget {
  const MonitoringSleepLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CommonLeftSideText(text: appFonts.sleep),
      const VSpace(Insets.i15),
      CommonContainerTile(
          paddingArea: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GroupViewSleepCommonContainer(
                  text: appFonts.sleptTime,
                  timeText: appFonts.time3,
                  svgImage: eSvgAssets.sleptTime),
              SvgPicture.asset(eSvgAssets.verticalLine),
              GroupViewSleepCommonContainer(
                  text: appFonts.wokeUpTime,
                  timeText: appFonts.time4,
                  svgImage: eSvgAssets.wokeTime)
            ]),
            const VSpace(Insets.i10),
            SvgPicture.asset(eSvgAssets.lineRuler),
            const VSpace(Insets.i10),
            Text(appFonts.duration,
                style: appCss.dmDenseMedium16
                    .textColor(appColor(context).appTheme.primary))
          ])),
      const VSpace(Insets.i25)
    ]);
  }
}
