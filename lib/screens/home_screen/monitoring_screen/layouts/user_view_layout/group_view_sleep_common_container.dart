import 'package:bhakti_app/config.dart';

class GroupViewSleepCommonContainer extends StatelessWidget {
  final String? text, timeText, svgImage;
  final double? width;

  const GroupViewSleepCommonContainer(
      {super.key, this.text, this.timeText, this.svgImage, this.width});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SvgPicture.asset(svgImage!),
        const HSpace(Insets.i8),
        Text(timeText!,
            style: appCss.dmDenseMedium16
                .textColor(appColor(context).appTheme.primary))
      ]),
      Text(text!,
              style: appCss.dmDenseMedium14
                  .textColor(appColor(context).appTheme.lightText))
          .paddingOnly(top: 4)
    ]);
  }
}
