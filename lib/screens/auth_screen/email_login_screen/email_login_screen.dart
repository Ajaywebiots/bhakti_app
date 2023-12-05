import 'package:bhakti_app/screens/auth_screen/email_login_screen/layouts/login_upper_layout.dart';
import 'package:flutter/gestures.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/providers/email_login_screen_provider/email_login_screen_provider.dart';
import 'layouts/login_bottom_layout.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({super.key});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EmailLoginProvider>(
        builder: (context1, emailLoginPvr, child) {
      return Stack(alignment: Alignment.center, children: [
        Scaffold(
            key: emailLoginPvr.scaffoldKey,
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
                  Form(
                      key: emailLoginPvr.formKey,
                      child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LoginUpperLayout(),
                            LoginBottomLayout()
                          ]).paddingSymmetric(horizontal: Insets.i20)),
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
                              ..onTap =
                                  () => emailLoginPvr.signUpNavigate(context))
                      ])).alignment(Alignment.bottomCenter)
                ]))),
        if (emailLoginPvr.isLoading) const CircularProgressIndicator()
      ]);
    });
  }
}
