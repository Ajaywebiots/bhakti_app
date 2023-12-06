import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:flutter_svg/svg.dart';

class CommonChantingContainer extends StatelessWidget {
  final String? chantingText, text;
  final GestureTapCallback? onTap;
  const CommonChantingContainer({super.key, this.chantingText, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.only(top: 10),
        margin: const EdgeInsets.fromLTRB(0,0,10,10),
        decoration: BoxDecoration(
            color: appColor(context).appTheme.whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: appColor(context).appTheme.shadowClr,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                  spreadRadius: 1)
            ]),
        height: Sizes.s86,
        width: Sizes.s106,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(eSvgAssets.chanting),
                Text(chantingText!,
                    style: appCss.dmDenseBold24
                        .textColor(appColor(context).appTheme.primary))
              ]),
          Text(text!,
              style: appCss.dmDenseMedium11
                  .textColor(appColor(context).appTheme.lightText))
        ])).inkWell(onTap: onTap);
  }
}
