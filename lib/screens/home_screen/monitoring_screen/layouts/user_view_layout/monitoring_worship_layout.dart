import 'package:bhakti_app/config.dart';

class MonitoringWorshipLayout extends StatelessWidget {
  const MonitoringWorshipLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
          }).toList()))
    ]);
  }
}
