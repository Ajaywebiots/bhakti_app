import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingListLayouts extends StatelessWidget {
  final String? svgImage, image;
  final String? text;
  final int? index;
  final List? list;
  final GestureTapCallback? onTap;
  final bool? isShare;
  final Widget? widget;

  const SettingListLayouts(
      {super.key,
      this.text,
      this.svgImage,
      this.index,
      this.list,
      this.onTap,
      this.image,
      this.widget,
      this.isShare = false});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          isShare == false
              ? SvgPicture.asset(svgImage!)
              : Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(image!)))),
          const HSpace(Insets.i10),
          Text(text!,
              style: appCss.dmDenseMedium16
                  .textColor(appColor(context).appTheme.rulesClr))
        ]),
        widget!
      ]).inkWell(onTap: onTap),
      if (index != list!.length - 1)
        SvgPicture.asset(eSvgAssets.lineRuler).paddingSymmetric(
            vertical: isShare == true ? Insets.i10 : Insets.i15)
    ]);
  }
}
