import 'dart:developer';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/phone_screen_provider/phone_login_provider.dart';
import 'package:bhakti_app/screens/auth_screen/otp_screen/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  static String verify = "";

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  TextEditingController phoneNumber = TextEditingController();
  String countryCode = '';
  bool isLoading = false;
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    countryCode = '+91';
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PhoneLoginProvider>(
        builder: (context, phoneLoginPvr, child) {
      return Stack(
        alignment: Alignment.center,
        children: [
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
                        CustomTitleWidget(
                            height: 52,
                            width: double.infinity,
                            color: const Color(0xff541F5C).withOpacity(.20),
                            title: 'Phone Number',
                            radius: 8,
                            child: TextFieldCommon(
                                validator: (value) {
                                  String? validateMobile(String value) {
                                    if (value.length != 10)
                                      return 'Mobile Number must be of 10 digit';
                                    else
                                      return null;
                                  }
                                },
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                hintText: "Phone Number",
                                controller: phoneNumber,
                                prefixIcon: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const HSpace(Insets.i20),
                                      SvgPicture.asset(eSvgAssets.call1,
                                          height: 20),
                                      const HSpace(Insets.i10),
                                      SvgPicture.asset(eSvgAssets.line,
                                          height: 24, width: 24),
                                      const HSpace(Insets.i20)
                                    ]))).paddingSymmetric(horizontal: 10),
                        const VSpace(Insets.i25),
                        const VSpace(Insets.i20),
                        Center(
                            child: GestureDetector(
                                onTap: () async {
                                  focusNode.unfocus();
                                  isLoading = true;
                                  setState(() {});
                                  log("number:::${countryCode + phoneNumber.text}");
                                  await FirebaseAuth.instance.verifyPhoneNumber(
                                      phoneNumber:
                                          countryCode + phoneNumber.text,
                                      verificationCompleted:
                                          (PhoneAuthCredential credential) {
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
                                          return OtpScreen();
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
                                        color:
                                            appColor(context).appTheme.primary,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text("Send OTP",
                                        style: appCss.dmDenseMedium16
                                            .textColor(Colors.white)))))
                      ]),
                    ))
                  ]))),
          if (isLoading) CircularProgressIndicator()
        ],
      );
    });
  }
}
