import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/providers/update_profile_provider.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/city_text_form_field.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/country_dropdownlist.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/dob_text_form_field.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/initiated_name_text_form_field.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/name_text_form_field.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/profile_picture_layout.dart';
import 'package:bhakti_app/screens/home_screen/update_profile/layouts/update_initiated_date_box.dart';
import 'package:bhakti_app/screens/home_screen/update_profile/layouts/update_initiated_status_checkbox.dart';
import 'package:bhakti_app/screens/home_screen/update_profile/layouts/update_marital_status_radiobutton.dart';
import 'package:bhakti_app/screens/home_screen/update_profile/layouts/update_spiritual_master_box.dart';
import 'package:bhakti_app/screens/home_screen/update_profile/layouts/update_yatra_name_text_field_box.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/email_text_form_field.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/gender_radio_button.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/phonenum_text_form_field.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/state_text_form_field.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(
        builder: (context, profilePvr, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(children: [
            SingleChildScrollView(
                child: Column(children: [
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(eImageAssets.splashBg))),
                  child: Form(
                      key: profilePvr.formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const VSpace(Insets.i70),
                            Row(children: [
                              SvgPicture.asset("assets/svg/arrowLeft.svg")
                                  .inkWell(onTap: () {
                                Navigator.pop(context);
                              }),
                              const HSpace(Insets.i90),
                              Text("Profile Edit",
                                  style: appCss.philosopherBold28
                                      .weight(FontWeight.w700)
                                      .textColor(const Color(0xff2d2d2d)))
                            ]),
                            const ProfilePicture(),
                            const NameTextBox(),
                            const DateOfBirthBox(),
                            const GenderRadioBox(),
                            const EmailTextBox(),
                            const PhoneNumberTextBox(),
                            const CountryDropDownBox(),
                            const StateTextFieldBox(),
                            const CityTextFieldBox(),
                            const UpdateYatraNameTextBox(),
                            const UpdateInitiatedStatusBox(),
                            const InitiatedNameTextBox(),
                            const UpdateSpiritualMasterBox(),
                            const UpdateInitiatedDateBox(),
                            const UpdateMaritalStatusBox(),
                            const VSpace(Insets.i20),
                            GestureDetector(
                                onTap: () => profilePvr.saveData(context),
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 44,
                                    width: 141,
                                    decoration: BoxDecoration(
                                        color:
                                            appColor(context).appTheme.primary,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text("Save",
                                        style: appCss.dmDenseBold16.textColor(
                                            appColor(context)
                                                .appTheme
                                                .whiteColor)))),
                            const VSpace(Insets.i30)
                          ]).paddingSymmetric(horizontal: 20)))
            ])),
            if (profilePvr.isLoading)
              Container(
                  color: Colors.black26.withOpacity(.4),
                  child: Center(
                      child: Material(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),
                          child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          appColor(context).appTheme.primary),
                                      // appColor.primaryColor
                                      strokeWidth: 3))))))
          ]));
    });
  }
}
