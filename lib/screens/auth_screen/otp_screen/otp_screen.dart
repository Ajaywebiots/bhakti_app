import 'dart:convert';
import 'dart:developer';

import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/common_api_provider.dart';
import 'package:bhakti_app/providers/otp_screen_provider.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/screens/auth_screen/phone_login_screen/phone_login_screen.dart';
import 'package:bhakti_app/screens/home_screen/home_screen.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/setup_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user_model.dart';
import '../../home_screen/layouts/common_bottom_bar.dart';

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
        width: Sizes.s56,
        height: Sizes.s56,
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
                            Image.asset(eImageAssets.bhaktiLogo,
                                height: Sizes.s63, width: Sizes.s267),
                            Text(appFonts.sadhanaRecord,
                                style: appCss.philosopherBold25),
                            VSpace(MediaQuery.of(context).size.height * 0.2),
                            const VSpace(Insets.i25),
                            SizedBox(
                                height: Sizes.s100,
                                child: Pinput(
                                    errorTextStyle: appCss.dmDenseMedium14
                                        .textColor(Colors.red),
                                    keyboardType: TextInputType.number,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    length: 6,
                                    validator: (value) {
                                      if (value == null || value.length != 6) {
                                        return 'Enter a 6-digit OTP';
                                      }
                                      return null;
                                    },
                                    controller: pinController,
                                    focusNode: focusNode,
                                    defaultPinTheme: defaultPinTheme,
                                    onCompleted: (pin) {
                                      debugPrint('onCompleted: $pin');
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                    },
                                    onChanged: (value) {
                                      debugPrint('onChanged: ${value.length}');
                                      if (value.length == 6) {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      }
                                    },
                                    focusedPinTheme: defaultPinTheme.copyWith(
                                        decoration: defaultPinTheme.decoration!.copyWith(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: focusedBorderColor))),
                                    submittedPinTheme: defaultPinTheme.copyWith(
                                        decoration: defaultPinTheme.decoration!.copyWith(
                                            color: fillColor,
                                            borderRadius:
                                                BorderRadius.circular(19),
                                            border: Border.all(
                                                color: focusedBorderColor))),
                                    errorPinTheme: defaultPinTheme.copyBorderWith(
                                        border:
                                            Border.all(color: Colors.redAccent)))),
                            if (isValid)
                              Text(appFonts.enterValidOTP,
                                  style: appCss.dmDenseMedium16.textColor(
                                      appColor(context).appTheme.red)),
                            const VSpace(Insets.i100),
                            Center(
                                child: GestureDetector(
                                    onTap: () async {
                                      if (formKey.currentState!.validate()) {
                                        SharedPreferences? preferences;
                                        focusNode.unfocus();
                                        isLoading = true;
                                        setState(() {});
                                        try {
                                          PhoneAuthCredential credential =
                                              PhoneAuthProvider.credential(
                                                  verificationId:
                                                      PhoneLoginScreen.verify,
                                                  smsCode: pinController.text);
                                          User? user =
                                              (await auth.signInWithCredential(
                                                      credential))
                                                  .user;
                                          log("credential::$credential");
                                          String? token =
                                              await user!.getIdToken();
                                          final commonApi =
                                              // ignore: use_build_context_synchronously
                                              Provider.of<CommonApiProvider>(
                                                  context,
                                                  listen: false);

                                          // ignore: use_build_context_synchronously
                                          await commonApi.socialLogin(
                                              context, token);
                                          isValid = false;
                                          setState(() {});
                                          // ignore: use_build_context_synchronously

                                          preferences = await SharedPreferences
                                              .getInstance();
                                          UserModel? userModel;
//Map user = json.decode(preferences!.getString(session.user)!);
                                          await Future.delayed(DurationsClass.s2);
                                          if (preferences
                                                  .getString(session.user) !=
                                              null) {
                                            userModel = UserModel.fromJson(
                                                json.decode(preferences
                                                    .getString(session.user)!));
                                            log("userModel ${userModel.name}");
                                            isLoading = false;
                                            setState(() {});
                                            if (userModel.name == null) {
                                              // ignore: use_build_context_synchronously
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return const SetUpProfile();
                                              }));
                                            } else {
                                              // ignore: use_build_context_synchronously
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return const CommonBottomNavigationBar();
                                              }));
                                            }
                                          } else {
                                            // ignore: use_build_context_synchronously
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return const SetUpProfile();
                                            }));
                                          }
                                        } on FirebaseAuthException catch (e) {
                                          log(
                                              'failed userOtp: ${e.message.toString()}');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content:
                                                      Text(appFonts.enterValidOTP)));
                                          isValid = true;
                                          setState(() {});
                                          isLoading = false;
                                          otpPvr.notifyListeners();
                                        }
                                      }
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: Sizes.s44,
                                        width: Sizes.s141,
                                        decoration: BoxDecoration(
                                            color: appColor(context)
                                                .appTheme
                                                .primary,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: Text(appFonts.verify,
                                            style: appCss.dmDenseMedium16
                                                .textColor(Colors.white)))))
                          ])))
                ]).paddingSymmetric(horizontal: 20))),
        if (isLoading) const CircularProgressIndicator()
      ]);
    });
  }
}
