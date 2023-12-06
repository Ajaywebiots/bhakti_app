import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CommonContainer extends StatelessWidget {
  final String? text, timeText, svgImage;
  final bool isSwitch = false;
  final ValueChanged<bool>? onToggle;
  final bool? status;
  final GestureTapCallback? onTap;
  final bool? isToggle;

  const CommonContainer(
      {super.key,
      this.text,
      this.timeText,
      this.svgImage,
      this.onToggle,
      this.status = false,
      this.onTap,
      this.isToggle = false});

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
                isToggle == true
                    ? const HSpace(Insets.i8)
                    : const HSpace(Insets.i51),
                isToggle == true
                    ? Text( timeText == "" ? appFonts.na : timeText!,
                        style: appCss.dmDenseMedium16
                            .textColor(appColor(context).appTheme.primary))
                    : FlutterSwitch(
                        width: Sizes.s41,
                        height: Sizes.s23,
                        padding: 3,
                        toggleSize: Sizes.s17,
                        value: status!,
                        activeColor: appColor(context).appTheme.primary,
                        inactiveColor: appColor(context).appTheme.lightText,
                        borderRadius: 40.0,
                        onToggle: onToggle!),
              ]),
              Text(text!,
                      style: appCss.dmDenseMedium14
                          .textColor(appColor(context).appTheme.lightText))
                  .paddingOnly(left: 10, top: 4)
            ])).inkWell(onTap: onTap);
  }
}
