import '../../../../../config.dart';

class MonitoringKnowledgeLayout extends StatelessWidget {
  const MonitoringKnowledgeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const VSpace(Insets.i25),
      CommonLeftSideText(text: appFonts.knowledge),
      const VSpace(Insets.i15),
      CommonContainerTile(
          paddingArea: const EdgeInsets.all(Insets.i15),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(appFonts.preachingAt,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).appTheme.rulesClr)),
              Text(appFonts.preachingTime,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).appTheme.lightText)),
              const HSpace(Insets.i20),
              SvgPicture.asset(eSvgAssets.verticalLine, height: 30),
              const HSpace(Insets.i20),
              Text(appFonts.classAt,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).appTheme.rulesClr)),
              Text(appFonts.classTime,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).appTheme.lightText))
            ]),
            const VSpace(Insets.i10),
            SvgPicture.asset(eSvgAssets.lineRuler),
            const VSpace(Insets.i10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(appFonts.otherKc,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).appTheme.rulesClr)),
              Text(appFonts.otherKcTime,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).appTheme.lightText))
            ])
          ])),
      const VSpace(Insets.i15)
    ]);
  }
}
