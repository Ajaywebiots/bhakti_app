import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonContainer extends StatelessWidget {
  final String? text, timeText, svgImage;
  final bool isSwitch = false;

  const CommonContainer({super.key, this.text, this.timeText, this.svgImage});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: appColor(context).appTheme.shadowClr,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                  spreadRadius: 0)
            ],
            color: appColor(context).appTheme.whiteColor),
        height: Sizes.s90,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const HSpace(Insets.i10),
                SvgPicture.asset(svgImage!),
                const HSpace(Insets.i8),
                Text(timeText!,
                    style: appCss.dmDenseMedium16
                        .textColor(appColor(context).appTheme.primary))
              ]),
              Text(text!,
                      style: appCss.dmDenseMedium14
                          .textColor(appColor(context).appTheme.lightText))
                  .paddingOnly(left: 10, top: 4)
            ]));
  }
}
