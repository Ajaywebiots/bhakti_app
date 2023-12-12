import '../../../../config.dart';

class MonitoringSingleUserLayout extends StatelessWidget {
  const MonitoringSingleUserLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      CommonLeftSideText(text: appFonts.sleep),
      const VSpace(Insets.i15),
      Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Insets.i8),
              color: appColor(context).appTheme.whiteColor),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  GroupViewSleepCommonContainer(
                      text: appFonts.sleptTime,
                      timeText: appFonts.time3,
                      svgImage: eSvgAssets.sleptTime),
                  const HSpace(Insets.i10),
                  SvgPicture.asset(eSvgAssets.verticalLine),
                  const HSpace(Insets.i10),
                  GroupViewSleepCommonContainer(
                      text: appFonts.wokeTime,
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
      const VSpace(Insets.i25),
      CommonLeftSideText(text: appFonts.chanting),
      const VSpace(Insets.i15),
      CommonContainerTile(paddingArea: EdgeInsets.zero,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonChantingRow(
                    countOne: appFonts.count,
                    countTwo: appFonts.count1,
                    textOne: appFonts.beforeTime,
                    textTwo: appFonts.beforeTime1),
                const VSpace(Insets.i10),
                SvgPicture.asset(eSvgAssets.lineRuler),
                const VSpace(Insets.i10),
                CommonChantingRow(
                    countOne: appFonts.count2,
                    countTwo: appFonts.count3,
                    textOne: appFonts.beforeTime2,
                    textTwo: appFonts.beforeTime3)
              ])),
      const VSpace(Insets.i25),
      CommonLeftSideText(text: appFonts.worship),
      const VSpace(Insets.i15),
      CommonContainerTile(
          paddingArea: const EdgeInsets.all(15),
          child: Column(
              children: appArray.worshipUserList.asMap().entries.map((e) {
            return Column(children: [
              Row(children: [
                SvgPicture.asset(e.value['svgImage']),
                const HSpace(Insets.i10),
                Text(e.value['title'],
                    style: appCss.dmDenseMedium16
                        .textColor(appColor(context).appTheme.primary)),
                const HSpace(Insets.i10),
                Text(e.value['data'],
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).appTheme.lightText))
              ]),
              if (e.key != e.value!.length)
                SvgPicture.asset(eSvgAssets.lineRuler)
                    .paddingOnly(top: 10, bottom: 10)
            ]);
          }).toList())),
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
    ]));
  }
}
