import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CommonRegulation extends StatelessWidget {
  final String? text;
  final bool? status;
  final ValueChanged<bool> onToggle;
  final int? index;
  final List? list;
  final bool? isRegulation;

  const CommonRegulation(
      {super.key,
      this.status,
      this.text,
      required this.onToggle,
      this.index,
      this.list,
      this.isRegulation = false});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text!,
                style: appCss.dmDenseMedium16
                    .textColor(appColor(context).appTheme.rulesClr)),
            FlutterSwitch(
                width: Sizes.s41,
                height: Sizes.s23,
                padding: 3,
                toggleSize: Sizes.s17,
                value: status!,
                activeColor: appColor(context).appTheme.primary,
                inactiveColor: appColor(context).appTheme.lightText,
                borderRadius: 40.0,
                onToggle: onToggle)
          ]),
      if (index != list!.length - 1)
        SvgPicture.asset(eSvgAssets.lineRuler).paddingSymmetric(
            vertical: isRegulation == true ? Insets.i10 : Insets.i15)
    ]);
  }
}
