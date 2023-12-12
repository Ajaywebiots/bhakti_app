import 'package:bhakti_app/config.dart';

class GroupViewSleepCommonContainer extends StatelessWidget {
  final String? text, timeText, svgImage;
  final double? width;

  const GroupViewSleepCommonContainer(
      {super.key, this.text, this.timeText, this.svgImage, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: appColor(context).appTheme.whiteColor),
        width: width??Sizes.s140,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
            ]));
  }
}
