import 'package:bhakti_app/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';
import 'package:bhakti_app/providers/email_login_screen_provider/email_login_screen_provider.dart';

class PasswordLoginTextField extends StatelessWidget {
  final EmailLoginProvider? dataPvr;

  const PasswordLoginTextField( {super.key,this.dataPvr});

  @override
  Widget build(BuildContext context) {
    return CustomTitleWidget(
        height: 52,
        width: double.infinity,
        title: 'Password',
        color: dataPvr!.passwordValid == null
            ? const Color(0xff541F5C).withOpacity(.20)
            : appColor(context).appTheme.red,
        radius: 8,
        child: TextFieldCommon(
            suffixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(eSvgAssets.hideEye)),
            validator: (value) {
              if (value!.isEmpty ||
                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                dataPvr!.passwordValid = appFonts.enterValidEmail;
                return 'Enter a valid Password!';
              } else {
                dataPvr!.passwordValid = null;
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
            hintText: 'Eg. Abc@2022',
            controller: dataPvr!.password,
            prefixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const HSpace(Sizes.s20),
                  SvgPicture.asset(eSvgAssets.lock, height: 20),
                  const HSpace(Sizes.s10),
                  SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                  const HSpace(Sizes.s20)
                ])));
  }
}
