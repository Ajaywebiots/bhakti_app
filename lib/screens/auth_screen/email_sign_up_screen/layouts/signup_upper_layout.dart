import 'package:bhakti_app/config.dart';

class SignUpUpperLayout extends StatelessWidget {
  const SignUpUpperLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EmailSignUpProvider>(
        builder: (context, emailSignUpPvr, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const VSpace(Insets.i40),
        Center(child: Image.asset(eImageAssets.bhaktiLogo, height: Sizes.s45)),
        const VSpace(Insets.i50),
        Text(appFonts.signUpHere1,
            style: appCss.philosopherBold28
                .textColor(appColor(context).appTheme.oneText)),
        Text(appFonts.enterYourDetailsBelow,
            style: appCss.dmDenseMedium14
                .textColor(appColor(context).appTheme.threeText)),
        const VSpace(Insets.i30),
        EmailSignUpTextField(
            validator: (value) => emailSignUpPvr.emailTextField(value),
            dataPvr: emailSignUpPvr),
        const VSpace(Insets.i20),
        PasswordSignUpTextField(
            validator: (value) => emailSignUpPvr.passwordTextField(value),
            obscureText: emailSignUpPvr.isHide ? true : false,
            dataPvr: emailSignUpPvr,
            suffixIcon: Padding(
                    padding: const EdgeInsets.all(Insets.i10),
                    child: emailSignUpPvr.isHide
                        ? SvgPicture.asset(eSvgAssets.hideEye)
                        : SvgPicture.asset(eSvgAssets.eye,
                            color: appColor(context).appTheme.primary))
                .inkWell(onTap: () => emailSignUpPvr.isShowPassword())),
        const VSpace(Insets.i25),
        Center(
                child: Container(
                    alignment: Alignment.center,
                    width: Sizes.s141,
                    height: Sizes.s44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: appColor(context).appTheme.primary),
                    child: Text(appFonts.signUp,
                        style: appCss.dmDenseMedium16
                            .textColor(appColor(context).appTheme.whiteColor))))
            .inkWell(onTap: () => emailSignUpPvr.emailSignupNavigate(context))
      ]);
    });
  }
}
