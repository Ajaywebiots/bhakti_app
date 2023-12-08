import '../../../../config.dart';

class LoginBottomLayout extends StatelessWidget {
  const LoginBottomLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<EmailLoginProvider, LoginAuthProvider>(
        builder: (context, emailLoginPvr, loginAuthPvr, child) {
      return Column(children: [
        const VSpace(Insets.i25),
        CommonButton(
            onTap: () => emailLoginPvr.loginButton(context),
            text: appFonts.login,
            width: Sizes.s141),
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
