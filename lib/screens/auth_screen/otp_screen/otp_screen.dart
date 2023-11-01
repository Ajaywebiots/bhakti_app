import 'dart:developer';

import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/otp_screen_provider/otp_screen_provider.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/screens/auth_screen/phone_login_screen/phone_login_screen.dart';
import 'package:bhakti_app/screens/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false, isValid = false;

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusedBorderColor =
        appColor(context).appTheme.primary.withOpacity(0.20);
    final fillColor = appColor(context).appTheme.whiteColor;
    final borderColor = appColor(context).appTheme.primary;

    final defaultPinTheme = PinTheme(
        width: 56,
        height: 56,
        textStyle: appCss.dmDenseMedium22
            .textColor(appColor(context).appTheme.lightText),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: borderColor)));
    return Consumer<OtpScreenProvider>(builder: (context1, otpPvr, child) {
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
                      Text("Sadhana Record", style: appCss.philosopherBold25),
                      VSpace(MediaQuery.of(context).size.height * 0.2),
                      const VSpace(Insets.i25),
                      SizedBox(
                          height: Sizes.s100,
                          child: Pinput(
                              errorTextStyle:
                                  appCss.dmDenseMedium14.textColor(Colors.red),
                              keyboardType: TextInputType.number,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              length: 6,
                              validator: (value) {
                                if (value == null || value.length != 6) {
                                  return 'Enter a 6-digit OTP';
                                }
                                return null;
                              },
                              controller: pinController,
                              focusNode: FocusNode(),
                              defaultPinTheme: defaultPinTheme,
                              onCompleted: (pin) {
                                debugPrint('onCompleted: $pin');
                                focusNode.unfocus();
                              },
                              onChanged: (value) {
                                debugPrint('onChanged: $value');
                                if (value.length == 6) {
                                  focusNode.unfocus();
                                }
                              },
                              focusedPinTheme: defaultPinTheme.copyWith(
                                  decoration: defaultPinTheme.decoration!
                                      .copyWith(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: focusedBorderColor))),
                              submittedPinTheme: defaultPinTheme.copyWith(
                                  decoration:
                                      defaultPinTheme.decoration!
                                          .copyWith(
                                              color: fillColor,
                                              borderRadius:
                                                  BorderRadius.circular(19),
                                              border: Border.all(
                                                  color: focusedBorderColor))),
                              errorPinTheme: defaultPinTheme.copyBorderWith(
                                  border:
                                      Border.all(color: Colors.redAccent)))),
                      if (isValid)
                        Text("Enter valid OTP",
                            style: appCss.dmDenseMedium16
                                .textColor(appColor(context).appTheme.red)),
                      const VSpace(Insets.i100),
                      Center(
                          child: GestureDetector(
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  focusNode.unfocus();
                                  isLoading = true;
                                  setState(() {});
                                  try {
                                    isLoading = false;
                                    setState(() {});
                                    PhoneAuthCredential credential =
                                        PhoneAuthProvider.credential(
                                            verificationId:
                                                PhoneLoginScreen.verify,
                                            smsCode: pinController.text!);
                                    await auth.signInWithCredential(credential);
                                    log("credential::$credential");
                                    isValid = false;
                                    setState(() {});
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const HomeScreen();
                                    }));
                                  } on FirebaseAuthException catch (e) {
                                    print(
                                        'failed Userotp: ${e.message.toString()}');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Enter ValidOTP")));

                                    isValid = true;
                                    setState(() {});
                                    isLoading = false;
                                    otpPvr.notifyListeners();
                                  }
                                }
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 44,
                                  width: 141,
                                  decoration: BoxDecoration(
                                      color: appColor(context).appTheme.primary,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Text("Verify",
                                      style: appCss.dmDenseMedium16
                                          .textColor(Colors.white)))))
                    ]),
                  ))
                ]).paddingSymmetric(horizontal: 20))),
        if (isLoading) const CircularProgressIndicator()
      ]);
    });
  }
}
