import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/loading_component.dart';

class EmailSignUpScreen extends StatefulWidget {
  const EmailSignUpScreen({super.key});

  @override
  State<EmailSignUpScreen> createState() => _EmailSignUpScreenState();
}

class _EmailSignUpScreenState extends State<EmailSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer3<EmailSignUpProvider, LoginAuthProvider,
            EmailLoginProvider>(
        builder:
            (context1, emailSignUpPvr, loginAuthPvr, emailLoginPvr, child) {
      return LoadingComponent(
        child: Scaffold(
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
                      key: emailSignUpPvr.formKey,
                      child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SignUpUpperLayout(),
                            SignUpBottomLayout(),
                          ]).paddingSymmetric(horizontal: Insets.i20)),
                  RichText(
                      text: TextSpan(
                          style: appCss.dmDenseSemiBold14
                              .textColor(appColor(context).appTheme.oneText),
                          children: [
                        TextSpan(text: appFonts.alreadyHaveAccount),
                        TextSpan(
                            text: appFonts.loginHere,
                            style: appCss.dmDenseSemiBold14
                                .textColor(appColor(context).appTheme.primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  emailSignUpPvr.alreadyAccountNavigate(context))
                      ])).alignment(Alignment.bottomCenter)
                ]))),
      );
    });
  }
}
