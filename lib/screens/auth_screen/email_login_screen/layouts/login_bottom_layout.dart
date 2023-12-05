import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/providers/login_auth_provider.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/assets/index.dart';
import '../../../../common/extension/spacing.dart';
import '../../../../config.dart';
import '../../../../providers/email_login_screen_provider/email_login_screen_provider.dart';
import 'common_social_container.dart';

class LoginBottomLayout extends StatelessWidget {
  const LoginBottomLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<EmailLoginProvider, LoginAuthProvider>(
        builder: (context, emailLoginPvr, loginAuthPvr, child) {
      return Column(children: [
        const VSpace(Insets.i25),
        Center(
                child: Container(
                    alignment: Alignment.center,
                    width: Sizes.s141,
                    height: Sizes.s44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: appColor(context).appTheme.primary),
                    child: Text(appFonts.login,
                        style: appCss.dmDenseMedium16
                            .textColor(appColor(context).appTheme.whiteColor))))
            .inkWell(onTap: () => emailLoginPvr.loginButton(context)),
        const VSpace(Insets.i28),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(eSvgAssets.line11),
          const HSpace(Insets.i8),
          Text(appFonts.or, style: appCss.dmDenseMedium12),
          const HSpace(Insets.i8),
          SvgPicture.asset(eSvgAssets.line11)
        ]),
        const VSpace(Insets.i20),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CommonSocialContainer(svgImage: eSvgAssets.call)
              .inkWell(onTap: () => emailLoginPvr.phoneLoginNavigate(context)),
          const HSpace(Insets.i15),
          CommonSocialContainer(svgImage: eSvgAssets.fb),
          const HSpace(Insets.i15),
          CommonSocialContainer(svgImage: eSvgAssets.google)
              .inkWell(onTap: () => loginAuthPvr.signInWithGoogle(context)),
          const HSpace(Insets.i15),
          CommonSocialContainer(svgImage: eSvgAssets.apple)
        ])
      ]);
    });
  }
}
