import 'package:bhakti_app/config.dart';

class LoginAuthScreen extends StatefulWidget {
  const LoginAuthScreen({super.key});

  @override
  State<LoginAuthScreen> createState() => _LoginAuthScreenState();
}

class _LoginAuthScreenState extends State<LoginAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginAuthProvider>(
        builder: (context1, loginAuthPvr, child) {
      return Scaffold(
          body: Container(
              height: double.infinity,
              padding: EdgeInsets.only(
                  bottom: Insets.i27,
                  top: MediaQuery.of(context).size.height * 0.13),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(eImageAssets.splashBg))),
              child: Stack(alignment: Alignment.topCenter, children: [
                SingleChildScrollView(
                    child: Column(children: [
                  Image.asset(eImageAssets.bhaktiLogo,
                      height: Sizes.s63, width: Sizes.s267),
                  Text(appFonts.sadhanaRecord, style: appCss.philosopherBold25),
                  VSpace(MediaQuery.of(context).size.height * 0.2),
                  AuthButtonLayout(
                      label: appFonts.loginViaPhone,
                      color: appColor(context).appTheme.phoneClr,
                      iconPath: eSvgAssets.phoneAuth,
                      onTap: () => loginAuthPvr.loginPhoneNavigator(context)),
                  const VSpace(Insets.i25),
                  AuthButtonLayout(
                      label: appFonts.loginViaGoogle,
                      color: appColor(context).appTheme.googleClr,
                      iconPath: eSvgAssets.googleAuth,
                      onTap: () => loginAuthPvr.signInWithGoogle(context)),
                  const VSpace(Insets.i25),
                  AuthButtonLayout(
                      label: appFonts.loginViaFacebook,
                      color: appColor(context).appTheme.fbClr,
                      iconPath: eSvgAssets.fbAuth,
                      onTap: () => loginAuthPvr.signInWithFacebook(context)),
                  const VSpace(Insets.i25),
                  AuthButtonLayout(
                      label: appFonts.signInWithEmail,
                      color: appColor(context).appTheme.emailClr,
                      iconPath: eSvgAssets.emailAuth,
                      onTap: () => loginAuthPvr.loginEmailNavigator(context))
                ]).paddingSymmetric(horizontal: Insets.i20)),
                Text(appFonts.aNewAccount).alignment(Alignment.bottomCenter)
              ])));
    });
  }
}
