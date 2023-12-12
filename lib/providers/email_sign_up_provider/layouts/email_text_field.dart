import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/providers/email_sign_up_provider/email_sign_up_provider.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:flutter_svg/svg.dart';

class EmailSignUpTextField extends StatelessWidget {
  final EmailSignUpProvider? dataPvr;
  final FormFieldValidator<String>? validator;

  const EmailSignUpTextField({super.key,this.dataPvr, this.validator});

  @override
  Widget build(BuildContext context) {
    return CustomTitleWidget(
        height: Sizes.s52,
        width: double.infinity,
        title: appFonts.email,
        color: dataPvr!.emailValid == null
            ? const Color(0xff541F5C).withOpacity(.20)
            : appColor(context).appTheme.red,
        radius: 8,
        child: TextFieldCommon(
            validator: validator,
            keyboardType: TextInputType.emailAddress,
            hintText: appFonts.egMail,
            controller: dataPvr!.emailId,
            prefixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const HSpace(Sizes.s20),
                  SvgPicture.asset(eSvgAssets.emailId, height: Sizes.s20),
                  const HSpace(Sizes.s10),
                  SvgPicture.asset(eSvgAssets.line, height: Sizes.s24, width: Sizes.s24),
                  const HSpace(Sizes.s20)
                ])));
  }
}
