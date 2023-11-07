import 'dart:developer';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/phone_screen_provider/phone_login_provider.dart';
import 'package:bhakti_app/screens/auth_screen/otp_screen/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  static String verify = "";

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  TextEditingController phoneNumber = TextEditingController();
  bool isLoading = false;
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String countryCode = "91";
  @override
  Widget build(BuildContext context) {
    return Consumer<PhoneLoginProvider>(
        builder: (context, phoneLoginPvr, child) {
      return Stack(alignment: Alignment.center, children: [
        Scaffold(
            body: Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.only(
                    bottom: Insets.i27,
                    top: MediaQuery.of(context).size.height * 0.13),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(eImageAssets.splashBg))),
                child: Stack(alignment: Alignment.topCenter, children: [
                  SingleChildScrollView(
                      child: Form(
                          key: formKey,
                          child: Column(children: [
                            Image.asset("assets/images/bhakti_logo.png",
                                height: 63, width: 267),
                            Text("Sadhana Record",
                                style: appCss.philosopherBold25),
                            VSpace(MediaQuery.of(context).size.height * 0.2),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: IntlPhoneField(
                                    pickerDialogStyle: PickerDialogStyle(
                                        padding: const EdgeInsets.all(20),
                                        searchFieldInputDecoration: InputDecoration(
                                            hintStyle: appCss.dmDenseExtraBold16
                                                .textColor(appColor(context)
                                                    .appTheme
                                                    .lightText),
                                            counterText: "",
                                            hintText:
                                                'Search Country Name/Code',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(
                                                            AppRadius.r10)),
                                                borderSide: BorderSide(
                                                    color: appColor(context)
                                                        .appTheme
                                                        .primary
                                                        .withOpacity(0.20))),
                                            disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).appTheme.primary.withOpacity(0.20)), borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10))),
                                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).appTheme.primary.withOpacity(0.20)), borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10))),
                                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).appTheme.primary.withOpacity(0.20)), borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10))))),
                                    onCountryChanged: (value) {
                                      countryCode = value.dialCode;
                                    },
                                    invalidNumberMessage: "Please Enter Valid Phone Number",
                                    validator: (p0) {
                                      if (p0!.number.isEmpty) {
                                        return 'Please Enter Your Number';
                                      }
                                      return null;
                                    },
                                    focusNode: focusNode,
                                    controller: phoneNumber,
                                    keyboardType: TextInputType.number,
                                    style: appCss.dmDenseExtraBold16.textColor(appColor(context).appTheme.lightText),
                                    decoration: InputDecoration(hintStyle: appCss.dmDenseExtraBold16.textColor(appColor(context).appTheme.primary.withOpacity(0.20)), counterText: "", hintText: 'Phone Number', label: Text('Phone Number', style: appCss.dmDenseExtraBold16.textColor(appColor(context).appTheme.lightText)), border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10)), borderSide: BorderSide(color: appColor(context).appTheme.primary.withOpacity(0.20))), disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).appTheme.primary.withOpacity(0.20)), borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10))), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).appTheme.primary.withOpacity(0.20)), borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10))), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).appTheme.primary.withOpacity(0.20)), borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10)))),
                                    initialCountryCode: 'IN',
                                    onChanged: (phone) {})),
                            const VSpace(Insets.i25),
                            const VSpace(Insets.i20),
                            Center(
                                child: GestureDetector(
                                    onTap: () async {
                                      FocusScope.of(context).requestFocus(FocusNode());
                                      isLoading = true;
                                      setState(() {});
                                      log("number:::${"+${countryCode + phoneNumber.text}"}");
                                      await FirebaseAuth.instance
                                          .verifyPhoneNumber(
                                              phoneNumber:
                                                  "+${countryCode + phoneNumber.text}",
                                              verificationCompleted:
                                                  (PhoneAuthCredential
                                                      credential) {
                                                isLoading = false;
                                                setState(() {});
                                              },
                                              verificationFailed:
                                                  (FirebaseAuthException e) {
                                                isLoading = false;
                                                setState(() {});
                                              },
                                              codeSent: (String verificationId,
                                                  int? resendToken) {
                                                PhoneLoginScreen.verify =
                                                    verificationId;
                                                isLoading = false;
                                                setState(() {});
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return const OtpScreen();
                                                }));
                                              },
                                              codeAutoRetrievalTimeout:
                                                  (String verificationId) {
                                                isLoading = false;
                                                setState(() {});
                                              });
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: 44,
                                        width: 141,
                                        decoration: BoxDecoration(
                                            color: appColor(context)
                                                .appTheme
                                                .primary,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: Text("Send OTP",
                                            style: appCss.dmDenseMedium16
                                                .textColor(Colors.white)))))
                          ])))
                ]))),
        if (isLoading) const CircularProgressIndicator()
      ]);
    });
  }
}
