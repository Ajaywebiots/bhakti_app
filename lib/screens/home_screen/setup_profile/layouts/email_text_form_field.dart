import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';

class EmailTextBox extends StatelessWidget {
  const EmailTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SetUpProfileProvider>(
        builder: (context, profilePvr, child) {
      return CustomTitleWidget(
        height: Sizes.s52,
        width: double.infinity,
        title: 'Email',
        color: profilePvr.emailValid == null
            ? const Color(0xff541F5C).withOpacity(.20)
            : appColor(context).appTheme.red,
        radius: 8,
        child: TextFieldCommon(
            validator: (value) {
              if (value!.isNotEmpty &&
                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                profilePvr.emailValid = appFonts.enterValidEmail;
                profilePvr.notifyListeners();
                return 'Enter a valid email!';
              } /*else {
                  profilePvr.emailValid = null;
                  profilePvr.notifyListeners();
                  return null;
                }*/
            },
            keyboardType: TextInputType.emailAddress,
            hintText: 'Email',
            controller: profilePvr.emailId,
            prefixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const HSpace(Insets.i20),
                  SvgPicture.asset(eSvgAssets.emailId, height: Sizes.s20),
                  const HSpace(Insets.i10),
                  SvgPicture.asset(eSvgAssets.line, height: Sizes.s24, width: Sizes.s24),
                  const HSpace(Insets.i20)
                ])),
      ).paddingSymmetric(vertical: 10);
    });
  }
}
