import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/providers/login_auth_provider.dart';
import 'package:bhakti_app/screens/auth_screen/login_auth_screen/layouts/auth_button_common_layout.dart';

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
                      iconPath: 'assets/svg/phoneAuth.svg',
                      onTap: () => loginAuthPvr.loginPhoneNavigator(context)),
                  const VSpace(Insets.i25),
                  AuthButtonLayout(
                      label: appFonts.loginViaGoogle,
                      color: appColor(context).appTheme.googleClr,
                      iconPath: 'assets/svg/googleAuth.svg',
                      onTap: () => loginAuthPvr.signInWithGoogle(context)),
                  const VSpace(Insets.i25),
                  AuthButtonLayout(
                      label: appFonts.loginViaFacebook,
                      color: appColor(context).appTheme.fbClr,
                      iconPath: 'assets/svg/fbAuth.svg',
                      onTap: () => loginAuthPvr.signInWithFacebook(context)),
                  const VSpace(Insets.i25),
                  AuthButtonLayout(
                      label: appFonts.signInWithEmail,
                      color: appColor(context).appTheme.emailClr,
                      iconPath: 'assets/svg/emailAuth.svg',
                      onTap: () => loginAuthPvr.loginEmailNavigator(context))
                ]).paddingSymmetric(horizontal: Insets.i20)),
                Text(appFonts.aNewAccount)
                    .alignment(Alignment.bottomCenter)
              ])));
    });
  }
}
