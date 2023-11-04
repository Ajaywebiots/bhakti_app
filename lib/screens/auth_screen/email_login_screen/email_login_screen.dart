import 'package:bhakti_app/providers/login_auth_provider/login_auth_provider.dart';
import 'package:bhakti_app/screens/auth_screen/email_sign_up_screen/email_sign_up_screen.dart';
import 'package:bhakti_app/screens/auth_screen/phone_login_screen/phone_login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:bhakti_app/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/setup_profile.dart';
import 'package:bhakti_app/providers/email_login_screen_provider/layouts/email_login_text_field.dart';
import 'package:bhakti_app/providers/email_login_screen_provider/layouts/password_login_text_field.dart';
import 'package:bhakti_app/providers/email_login_screen_provider/email_login_screen_provider.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({super.key});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<EmailLoginProvider, LoginAuthProvider>(
        builder: (context1, emailLoginPvr, loginAuthPvr, child) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
              height: double.infinity,
              padding: EdgeInsets.only(
                  bottom: Insets.i27,
                  top: MediaQuery.of(context).size.height * 0.08),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(eImageAssets.splashBg))),
              child: Stack(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const VSpace(Insets.i40),
                  Center(
                      child: Image.asset(eImageAssets.bhaktiLogo,
                          height: Sizes.s45)),
                  const VSpace(Insets.i50),
                  Text("Login Here..",
                      style: appCss.philosopherBold28
                          .textColor(appColor(context).appTheme.oneText)),
                  Text("Enter your details below",
                      style: appCss.dmDenseMedium14
                          .textColor(appColor(context).appTheme.threeText)),
                  const VSpace(Insets.i30),
                  EmailLoginTextField(dataPvr: emailLoginPvr),
                  const VSpace(Insets.i20),
                  PasswordLoginTextField(dataPvr: emailLoginPvr),
                  const VSpace(Insets.i8),
                  TextButton(
                          onPressed: () {},
                          child: Text(appFonts.forgotPassword,
                              style: appCss.dmDenseMedium14.textColor(
                                  appColor(context).appTheme.primary),
                              textAlign: TextAlign.end))
                      .alignment(Alignment.centerRight),
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
                                  style: appCss.dmDenseMedium16.textColor(
                                      appColor(context).appTheme.whiteColor))))
                      .inkWell(onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SetUpProfile();
                    }));
                  }),
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
                    Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                      color: appColor(context)
                                          .appTheme
                                          .black
                                          .withOpacity(.2),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4))
                                ]),
                            height: 46,
                            width: 46,
                            alignment: Alignment.center,
                            child: SvgPicture.asset(eSvgAssets.call))
                        .inkWell(onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const PhoneLoginScreen();
                      }));
                    }),
                    const HSpace(Insets.i15),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                  color: appColor(context)
                                      .appTheme
                                      .black
                                      .withOpacity(.2),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4))
                            ]),
                        height: 46,
                        width: 46,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(eSvgAssets.fb)),
                    const HSpace(Insets.i15),
                    Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                      color: appColor(context)
                                          .appTheme
                                          .black
                                          .withOpacity(.2),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4))
                                ]),
                            height: 46,
                            width: 46,
                            alignment: Alignment.center,
                            child: SvgPicture.asset(eSvgAssets.google))
                        .inkWell(onTap: () {
                      loginAuthPvr.signInWithGoogle(context);
                    }),
                    const HSpace(Insets.i15),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                  color: appColor(context)
                                      .appTheme
                                      .black
                                      .withOpacity(.2),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4))
                            ]),
                        height: 46,
                        width: 46,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(eSvgAssets.apple))
                  ])
                ]).paddingSymmetric(horizontal: Insets.i20),
                RichText(
                    text: TextSpan(
                        style: appCss.dmDenseSemiBold14
                            .textColor(appColor(context).appTheme.oneText),
                        children: [
                      TextSpan(text: appFonts.doNotHaveAccount),
                      TextSpan(
                          text: appFonts.signUpHere,
                          style: appCss.dmDenseSemiBold14
                              .textColor(appColor(context).appTheme.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const EmailSignUpScreen();
                              }));
                            })
                    ])).alignment(Alignment.bottomCenter)
              ])));
    });
  }
}
