import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingParameters extends StatelessWidget {
  const SettingParameters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
            leading: Container(),
            backgroundColor: Colors.transparent,
            titleSpacing: 0,
            leadingWidth: 0,
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const HSpace(Insets.i20),
              SvgPicture.asset("assets/svg/arrowLeft.svg").inkWell(
                onTap: () => Navigator.pop(context),
              ),
              const HSpace(Insets.i90),
              Text("Parameters",
                  style: appCss.philosopherBold28
                      .textColor(appColor(context).appTheme.oneText))
            ])),
        body: Stack(alignment: Alignment.topLeft, children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(eImageAssets.splashBg)))),
          SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            VSpace(Insets.i120),
            CustomTitleWidget(
              height: 52,
              width: double.infinity,
              title: 'Number of Rounds Chanting',
              color: const Color(0xff541F5C).withOpacity(.20),
              radius: 8,
              child: TextFieldCommon(
                  keyboardType: TextInputType.emailAddress,
                  // controller: emailId,
                  prefixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const HSpace(Insets.i20),
                        SvgPicture.asset("assets/svg/calculator.svg",
                            height: 20),
                        const HSpace(Insets.i10),
                        SvgPicture.asset(eSvgAssets.line,
                            height: 24, width: 24),
                        const HSpace(Insets.i20)
                      ]))
            ).paddingSymmetric(vertical: 10),
            CustomTitleWidget(
              height: 52,
              width: double.infinity,
              title: 'Average Time for Each Round',
              color: const Color(0xff541F5C).withOpacity(.20),
              radius: 8,
              child: TextFieldCommon(
                  keyboardType: TextInputType.emailAddress,
                  // controller: emailId,
                  prefixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const HSpace(Insets.i20),
                        SvgPicture.asset("assets/svg/clock.svg", height: 20),
                        const HSpace(Insets.i10),
                        SvgPicture.asset(eSvgAssets.line,
                            height: 24, width: 24),
                        const HSpace(Insets.i20)
                      ]))
            ).paddingSymmetric(vertical: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: appColor(context).appTheme.primary),
                          borderRadius: BorderRadius.circular(8)),
                      height: 44,
                      width: 120,
                      child: Text("Cancel",
                          style: appCss.dmDenseMedium16
                              .textColor(appColor(context).appTheme.primary)))
                  .inkWell(onTap: () {
                Navigator.pop(context);
              }),
              const HSpace(Insets.i15),
              Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: appColor(context).appTheme.primary),
                      height: 44,
                      width: 120,
                      child: Text("Save",
                          style: appCss.dmDenseMedium16.textColor(
                              appColor(context).appTheme.whiteColor)))
                  .inkWell(onTap: () {
                Navigator.pop(context);
              })
            ]).marginSymmetric(vertical: Insets.i20)
          ]).paddingSymmetric(horizontal: 20))
        ]));
  }
}