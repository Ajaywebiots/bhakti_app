import 'dart:developer';

import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';

class UpdatePhoneNumberTextBox extends StatelessWidget {
  const UpdatePhoneNumberTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(
        builder: (context1, updateProfilePvr, child) {
      return CustomTitleWidget(
          height: 52,
          width: double.infinity,
          color: updateProfilePvr.phoneNumberValid == null
              ? const Color(0xff541F5C).withOpacity(.20)
              : appColor(context).appTheme.red,
          title: 'Phone Number',
          radius: 8,
          child: TextFieldCommon(
              maxLength: 10,
              validator: (value) =>
                  updateProfilePvr.phoneNumberValidator(value),
              keyboardType: TextInputType.number,
              hintText: "Phone Number",
              controller: updateProfilePvr.phoneNum,
              prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Insets.i20),
                    CountryCodePicker(
                        showFlag: false,
                        searchDecoration: const InputDecoration(
                            hintText: "Search Country Code"),
                        padding: EdgeInsets.zero,
                        onChanged: (value) =>
                            updateProfilePvr.countryCodeOnChanged(value),
                        textStyle: appCss.dmDenseMedium14
                            .textColor(appColor(context).appTheme.lightText),
                        dialogTextStyle: appCss.dmDenseMedium16,
                        initialSelection: "${updateProfilePvr.countryCode}",
                        favorite: const ['+91', 'भारत'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false),
                    const HSpace(Insets.i10),
                    SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                    const HSpace(Insets.i20)
                  ]))).paddingSymmetric(vertical: 10);
    });
  }
}
