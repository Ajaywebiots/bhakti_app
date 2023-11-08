import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/providers/login_auth_provider.dart';
import 'package:bhakti_app/screens/auth_screen/email_login_screen/email_login_screen.dart';
import 'package:bhakti_app/screens/auth_screen/login_auth_screen/layouts/auth_button_common_layout.dart';
import 'package:bhakti_app/screens/auth_screen/phone_login_screen/phone_login_screen.dart';
import 'package:bhakti_app/screens/home_screen/home_screen.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/setup_profile.dart';

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
                  Image.asset("assets/images/bhakti_logo.png",
                      height: 63, width: 267),
                  Text("Sadhana Record", style: appCss.philosopherBold25),
                  VSpace(MediaQuery.of(context).size.height * 0.2),
                  AuthButtonLayout(
                      label: 'Login via Phone',
                      color: appColor(context).appTheme.phoneClr,
                      iconPath: 'assets/svg/phoneAuth.svg',
                      onTap: () => loginAuthPvr.loginPhoneNavigator(context)),
                  const VSpace(Insets.i25),
                  AuthButtonLayout(
                      label: 'Login via Google',
                      color: appColor(context).appTheme.googleClr,
                      iconPath: 'assets/svg/googleAuth.svg',
                      onTap: () => loginAuthPvr.signInWithGoogle(context)),
                  const VSpace(Insets.i25),
                  AuthButtonLayout(
                      label: 'Login via Facebook',
                      color: appColor(context).appTheme.fbClr,
                      iconPath: 'assets/svg/fbAuth.svg',
                      onTap: () =>
                          loginAuthPvr.loginFacebookNavigator(context)),
                  const VSpace(Insets.i25),
                  AuthButtonLayout(
                      label: 'Sign in with email',
                      color: appColor(context).appTheme.emailClr,
                      iconPath: 'assets/svg/emailAuth.svg',
                      onTap: () => loginAuthPvr.loginEmailNavigator(context))
                ]).paddingSymmetric(horizontal: Insets.i20)),
                const Text("A new account will be created on the first login")
                    .alignment(Alignment.bottomCenter)
              ])));
    });
  }
}
