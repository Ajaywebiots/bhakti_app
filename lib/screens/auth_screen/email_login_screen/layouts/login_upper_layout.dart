import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/email_login_screen_provider/email_login_screen_provider.dart';
import 'package:bhakti_app/providers/email_login_screen_provider/layouts/email_login_text_field.dart';
import 'package:bhakti_app/providers/email_login_screen_provider/layouts/password_login_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/assets/index.dart';

class LoginUpperLayout extends StatelessWidget {
  const LoginUpperLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EmailLoginProvider>(
        builder: (context, emailLoginPvr, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const VSpace(Insets.i40),
        Center(child: Image.asset(eImageAssets.bhaktiLogo, height: Sizes.s45)),
        const VSpace(Insets.i50),
        Text(appFonts.loginHere1,
            style: appCss.philosopherBold28
                .textColor(appColor(context).appTheme.oneText)),
        Text(appFonts.enterYourDetail,
            style: appCss.dmDenseMedium14
                .textColor(appColor(context).appTheme.threeText)),
        const VSpace(Insets.i30),
        EmailLoginTextField(
            validator: (value) => emailLoginPvr.emailValidator(value),
            dataPvr: emailLoginPvr),
        const VSpace(Insets.i20),
        PasswordLoginTextField(
            validator: (value) => emailLoginPvr.passwordValidator(value),
            obscureText: emailLoginPvr.isHide ? true : false,
            dataPvr: emailLoginPvr,
            suffixIcon: Padding(
                    padding: const EdgeInsets.all(Insets.i10),
                    child: emailLoginPvr.isHide
                        ? SvgPicture.asset(eSvgAssets.hideEye)
                        : SvgPicture.asset(eSvgAssets.eye,
                            colorFilter: ColorFilter.mode(
                                appColor(context).appTheme.primary,
                                BlendMode.srcIn)))
                .inkWell(onTap: () => emailLoginPvr.isPasswordHide())),
        const VSpace(Insets.i8),
        TextButton(
                onPressed: () => emailLoginPvr.forgotPassword(),
                child: Text(appFonts.forgotPassword,
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).appTheme.primary),
                    textAlign: TextAlign.end))
            .alignment(Alignment.centerRight)
      ]);
    });
  }
}
