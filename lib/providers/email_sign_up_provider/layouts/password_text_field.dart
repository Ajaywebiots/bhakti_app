import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/email_sign_up_provider/email_sign_up_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';

class PasswordSignUpTextField extends StatelessWidget {
  final EmailSignUpProvider? dataPvr;
  final Widget? suffixIcon;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;

  const PasswordSignUpTextField({super.key, this.dataPvr, this.suffixIcon, this.obscureText, this.validator});

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
        child: TextFieldCommon(obscureText: obscureText!,
            suffixIcon: suffixIcon,
            validator: validator,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Eg. Abcd@2022',
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
