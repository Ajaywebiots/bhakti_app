import 'package:bhakti_app/config.dart';

class PhoneLoginUpperLayout extends StatelessWidget {
  const PhoneLoginUpperLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PhoneLoginProvider>(
        builder: (context, phoneLoginPvr, child) {
      return Column(children: [
        Image.asset(eImageAssets.bhaktiLogo,
            height: Sizes.s63, width: Sizes.s267),
        Text(appFonts.sadhanaRecord, style: appCss.philosopherBold25),
        VSpace(MediaQuery.of(context).size.height * 0.2),
        IntlPhoneField(
                pickerDialogStyle: PickerDialogStyle(
                    padding: const EdgeInsets.all(Insets.i20),
                    searchFieldInputDecoration: InputDecoration(
                        hintStyle: appCss.dmDenseExtraBold16
                            .textColor(appColor(context).appTheme.lightText),
                        counterText: "",
                        hintText: appFonts.searchCountryName,
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(AppRadius.r10)),
                            borderSide: BorderSide(
                                color: appColor(context)
                                    .appTheme
                                    .primary
                                    .withOpacity(0.20))),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: appColor(context)
                                    .appTheme
                                    .primary
                                    .withOpacity(0.20)),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(AppRadius.r10))),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).appTheme.primary.withOpacity(0.20)), borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10))),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).appTheme.primary.withOpacity(0.20)), borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10))))),
                onCountryChanged: (value) => phoneLoginPvr.onCountryChanged(value),
                invalidNumberMessage: "Please Enter Valid Phone Number",
                validator: (p0) => phoneLoginPvr.validator(p0),
                focusNode: phoneLoginPvr.focusNode,
                controller: phoneLoginPvr.phoneNumber,
                keyboardType: TextInputType.number,
                style: appCss.dmDenseExtraBold16.textColor(appColor(context).appTheme.lightText),
                decoration: InputDecoration(
                    hintStyle: appCss.dmDenseExtraBold16.textColor(appColor(context).appTheme.primary.withOpacity(0.20)),
                    counterText: "",
                    hintText: appFonts.phoneNumber,
                    label: Text(
                      appFonts.phoneNumber,
                      style: appCss.dmDenseExtraBold16
                          .textColor(appColor(context).appTheme.lightText)
                    ),
                    border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10)), borderSide: BorderSide(color: appColor(context).appTheme.primary.withOpacity(0.20))),
                    disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).appTheme.primary.withOpacity(0.20)), borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).appTheme.primary.withOpacity(0.20)), borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10))),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).appTheme.primary.withOpacity(0.20)), borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10)))),
                initialCountryCode: appFonts.iN)
            .paddingSymmetric(horizontal: Insets.i20)
      ]);
    });
  }
}
