import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonBottomBar extends StatelessWidget {
  const CommonBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        decoration: BoxDecoration(color: appColor(context).appTheme.primary),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const SizedBox(height: 14),
            SvgPicture.asset("assets/svg/home.svg"),
            Text("Home",
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).appTheme.whiteColor)),
            const SizedBox(height: 0),
            SvgPicture.asset("assets/svg/activeLine.svg")
          ]).inkWell(
            onTap: () {},
          ),
          const HSpace(Insets.i40),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const SizedBox(height: 14),
            SvgPicture.asset("assets/svg/category.svg"),
            Text("Dashboard",
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).appTheme.whiteColor)),
            const SizedBox(height: 5)
          ]).inkWell(
            onTap: () {},
          ),
          const HSpace(Insets.i40),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const SizedBox(height: 14),
            SvgPicture.asset("assets/svg/monitering.svg"),
            Text("Monitoring",
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).appTheme.whiteColor)),
            const SizedBox(height: 5)
          ]).inkWell(
            onTap: () {},
          ),
          const HSpace(Insets.i40),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const SizedBox(height: 14),
            SvgPicture.asset("assets/svg/setting.svg"),
            Text("Setting",
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).appTheme.whiteColor)),
            const SizedBox(height: 5)
          ]).inkWell(
            onTap: () {},
          )
        ]));
  }
}
