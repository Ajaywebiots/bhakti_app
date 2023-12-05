import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/email_login_screen_provider/email_login_screen_provider.dart';
import 'package:bhakti_app/providers/login_auth_provider.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/assets/index.dart';
import '../../email_login_screen/layouts/common_social_container.dart';

class SignUpBottomLayout extends StatelessWidget {
  const SignUpBottomLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<EmailLoginProvider, LoginAuthProvider>(
        builder: (context, emailLoginPvr, loginAuthPvr, child) {
      return Column(children: [
        const VSpace(Insets.i28),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset("assets/svg/line11.svg"),
          const HSpace(Insets.i8),
          Text("Or", style: appCss.dmDenseMedium12),
          const HSpace(Insets.i8),
          SvgPicture.asset("assets/svg/line11.svg")
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
