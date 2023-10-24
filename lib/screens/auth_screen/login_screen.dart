import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/login_screen_provider/login_screen_provider.dart';
import 'package:bhakti_app/screens/auth_screen/layouts/password_text_field.dart';
import 'package:bhakti_app/screens/home_screen/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'layouts/email_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginScreenProvider>(
        builder: (context, loginScreenPvr, child) {
      return Scaffold(
          body: Container(
              padding: EdgeInsets.only(
                  bottom: Insets.i27,
                  top: MediaQuery.of(context).size.height * 0.08),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(eImageAssets.splashBg))),
              child: Stack(alignment: Alignment.bottomCenter, children: [
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
                  EmailTextField(loginScreenPvr),
                  const VSpace(Insets.i20),
                  PasswordTextField(loginScreenPvr),
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
                      return HomeScreen();
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
                        child: SvgPicture.asset(eSvgAssets.call)),
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
                        child: SvgPicture.asset(eSvgAssets.google)),
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
                        children: <TextSpan>[
                      TextSpan(text: appFonts.doNotHaveAccount),
                      TextSpan(
                          text: appFonts.signUpHere,
                          style: appCss.dmDenseSemiBold14
                              .textColor(appColor(context).appTheme.primary))
                    ])),
              ])));
    });
  }
}
