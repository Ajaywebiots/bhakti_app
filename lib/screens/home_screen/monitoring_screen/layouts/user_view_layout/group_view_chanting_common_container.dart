import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:flutter_switch/flutter_switch.dart';

class GroupViewChantingCommonContainer extends StatelessWidget {
  final String? text, countText, svgImage;

  const GroupViewChantingCommonContainer(
      {super.key, this.text, this.countText, this.svgImage});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: appColor(context).appTheme.whiteColor),
        width: Sizes.s150,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(svgImage!),
                    const HSpace(Insets.i10),
                    Column(children: [
                      Text(countText!,
                          style: appCss.dmDenseBold24
                              .textColor(appColor(context).appTheme.primary)),
                      Text(text!,
                          style: appCss.dmDenseMedium11
                              .textColor(appColor(context).appTheme.lightText))
                    ])
                  ])
            ]));
  }
}
