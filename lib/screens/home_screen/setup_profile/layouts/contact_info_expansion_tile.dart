import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/phonenum_text_form_field.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/layouts/state_text_form_field.dart';
import '../../../../config.dart';
import 'city_text_form_field.dart';
import 'country_dropdownlist.dart';

class ContactInfoExpansionTile extends StatelessWidget {
  const ContactInfoExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SetUpProfileProvider>(
        builder: (context1, setUpProfilePvr, child) {
      return ExpansionTile(
          onExpansionChanged: (value) =>
              setUpProfilePvr.onContactInfoExpansionChanged(),
          tilePadding: EdgeInsets.zero,
          trailing: SvgPicture.asset(setUpProfilePvr.onChange1 == false
              ? eSvgAssets.arrowDown1
              : eSvgAssets.arrowUp),
          leading: Text(appFonts.contactInfo,
              style: appCss.philosopherBold18
                  .textColor(appColor(context).appTheme.lightText)),
          title: SvgPicture.asset(eSvgAssets.profileLine,
                  width: Sizes.s200, fit: BoxFit.fill)
              .paddingOnly(top: Insets.i5),
          children: const <Widget>[
            PhoneNumberTextBox(),
            VSpace(Insets.i18),
            CountryDropDownBox(),
            VSpace(Insets.i18),
            StateTextFieldBox(),
            VSpace(Insets.i18),
            CityTextFieldBox()
          ]);
    });
  }
}
