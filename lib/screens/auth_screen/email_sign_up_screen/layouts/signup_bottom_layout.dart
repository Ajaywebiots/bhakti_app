import 'package:bhakti_app/config.dart';

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
