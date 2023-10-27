import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/providers/setup_profile_provider/setup_profile_provider.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/city_text_form_field.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/country_dropdownlist.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/dob_text_form_field.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/email_text_form_field.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/gender_radio_button.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/initiated_name_text_form_field.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/name_text_form_field.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/phonenum_text_form_field.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/state_text_form_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'layouts/profile_picture_layout.dart';

class SetUpProfile extends StatefulWidget {
  const SetUpProfile({super.key});

  @override
  State<SetUpProfile> createState() => _SetUpProfileState();
}

class _SetUpProfileState extends State<SetUpProfile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SetUpProfileProvider>(
        builder: (context, profilePvr, child) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          body: Stack(children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(eImageAssets.splashBg)))),
            SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VSpace(Sizes.s15),
                    Text(appFonts.setUp, style: appCss.philosopherBold28),
                    const VSpace(Sizes.s10),
                    Text(appFonts.enterYourDetails,
                        style: appCss.dmDenseRegular14
                            .textColor(appColor(context).appTheme.lightText)),
                    const VSpace(Insets.i20),
                    const Center(child: ProfilePicture()),
                    ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        trailing: SvgPicture.asset(eSvgAssets.arrowUp),
                        leading: Text("Personal Info",
                            style: appCss.philosopherBold18.textColor(
                                appColor(context).appTheme.lightText)),
                        title: SvgPicture.asset(
                          eSvgAssets.profileLine,
                          width: 200,
                          fit: BoxFit.fill,
                        ).paddingOnly(top: Insets.i5),
                        children: const <Widget>[
                          NameTextBox(),
                          VSpace(Insets.i18),
                          InitiatedNameTextBox(),
                          VSpace(Insets.i18),
                          EmailTextBox(),
                          VSpace(Insets.i18),
                          DateOfBirthBox(),
                          VSpace(Insets.i18),
                          GenderRadioBox()
                        ]),
                    ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        trailing: SvgPicture.asset(eSvgAssets.arrowUp),
                        leading: Text("Contact Info",
                            style: appCss.philosopherBold18.textColor(
                                appColor(context).appTheme.lightText)),
                        title: SvgPicture.asset(
                          eSvgAssets.profileLine,
                          width: 200,
                          fit: BoxFit.fill,
                        ).paddingOnly(top: Insets.i5),
                        children: const <Widget>[
                          PhoneNumberTextBox(),
                          VSpace(Insets.i18),
                          CountryDropDownBox(),
                          VSpace(Insets.i18),
                          StateTextFieldBox(),
                          VSpace(Insets.i18),
                          CityTextFieldBox()
                        ]),
                    const VSpace(Insets.i18),
                    Center(
                      child: GestureDetector(
                          onTap: () => profilePvr.saveData(context),
                          child: Container(
                              alignment: Alignment.center,
                              height: 44,
                              width: 141,
                              decoration: BoxDecoration(
                                  color: appColor(context).appTheme.primary,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Text(appFonts.save,
                                  style: appCss.dmDenseMedium16
                                      .textColor(Colors.white)))),
                    )
                  ]).marginSymmetric(horizontal: 20, vertical: 60),
            )
          ]));
    });
  }
}
