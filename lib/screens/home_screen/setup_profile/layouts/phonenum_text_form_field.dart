import 'dart:developer';

import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';

class PhoneNumberTextBox extends StatelessWidget {
  const PhoneNumberTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SetUpProfileProvider>(
        builder: (context, setupProfilePvr, child) {
      return CustomTitleWidget(
          height: 52,
          width: double.infinity,
          color: setupProfilePvr.phoneNumberValid == null
              ? const Color(0xff541F5C).withOpacity(.20)
              : appColor(context).appTheme.red,
          title: 'Phone Number',
          radius: 8,
          child: TextFieldCommon(
              maxLength: 10,
              validator: (value) {
                if (value!.isNotEmpty) {
                  setupProfilePvr.phoneNumberValid = null;
                  setupProfilePvr.notifyListeners();
                  return null;
                }
                return null;
              },
              keyboardType: TextInputType.number,
              hintText: "Phone Number",
              controller: setupProfilePvr.phoneNum,
              prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Insets.i20),
                    CountryCodePicker(
                        showFlag: false,
                        searchDecoration:
                        InputDecoration(hintText: "Search Country Code"),
                        padding: EdgeInsets.zero,
                        onChanged: (value) {
                          log("coudhsfjsdhf$value");
                          setupProfilePvr.countryCode = value;
                          setupProfilePvr.notifyListeners();
                        },
                        textStyle: appCss.dmDenseMedium14
                            .textColor(appColor(context).appTheme.lightText),
                        dialogTextStyle: appCss.dmDenseMedium16,
                        initialSelection: 'IT',
                        favorite: const ['+91', 'भारत'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false),
                    const HSpace(Insets.i10),
                    SvgPicture.asset(eSvgAssets.line, height: Sizes.s24, width: Sizes.s24),
                    const HSpace(Insets.i20)
                  ]))).paddingSymmetric(vertical: 10);
    });
  }
}
