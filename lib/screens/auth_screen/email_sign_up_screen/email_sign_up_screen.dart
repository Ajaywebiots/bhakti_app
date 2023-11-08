import 'dart:developer';

import 'package:bhakti_app/providers/email_sign_up_provider/email_sign_up_provider.dart';
import 'package:bhakti_app/providers/email_sign_up_provider/layouts/email_text_field.dart';
import 'package:bhakti_app/providers/email_sign_up_provider/layouts/password_text_field.dart';
import 'package:bhakti_app/providers/login_auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:bhakti_app/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';

class EmailSignUpScreen extends StatefulWidget {
  const EmailSignUpScreen({super.key});

  @override
  State<EmailSignUpScreen> createState() => _EmailSignUpScreenState();
}

class _EmailSignUpScreenState extends State<EmailSignUpScreen> {
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return Consumer2<EmailSignUpProvider, LoginAuthProvider>(
        builder: (context1, emailSignUpPvr, loginAuthPvr, child) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
              height: double.infinity,
              padding: EdgeInsets.only(
                  bottom: Insets.i27,
                  top: MediaQuery.of(context).size.height * 0.08),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(eImageAssets.splashBg))),
              child: Stack(children: [
                Form(
                  key: emailSignUpPvr.formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VSpace(Insets.i40),
                        Center(
                            child: Image.asset(eImageAssets.bhaktiLogo,
                                height: Sizes.s45)),
                        const VSpace(Insets.i50),
                        Text("Sign Up Here..",
                            style: appCss.philosopherBold28
                                .textColor(appColor(context).appTheme.oneText)),
                        Text("Enter your details below",
                            style: appCss.dmDenseMedium14.textColor(
                                appColor(context).appTheme.threeText)),
                        const VSpace(Insets.i30),
                        EmailSignUpTextField(
                          validator: (value) {
                            setState(() {});
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              emailSignUpPvr.emailValid =
                                  appFonts.enterValidEmail;
                              return appFonts.enterValidEmail;
                            } else {
                              emailSignUpPvr.emailValid = null;
                              return null;
                            }
                          },
                          dataPvr: emailSignUpPvr,
                        ),
                        const VSpace(Insets.i20),
                        PasswordSignUpTextField(
                            validator: (value) {
                              setState(() {});
                              if (value!.isEmpty ||
                                  !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                      .hasMatch(value)) {
                                emailSignUpPvr.passwordValid =
                                    appFonts.enterValidEmail;
                                return 'Enter a valid Password!';
                              } else {
                                emailSignUpPvr.passwordValid = null;
                                return null;
                              }
                            },
                            obscureText: isHide ? true : false,
                            dataPvr: emailSignUpPvr,
                            suffixIcon: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: isHide
                                        ? SvgPicture.asset(eSvgAssets.hideEye)
                                        : SvgPicture.asset("assets/svg/eye.svg",
                                            color: appColor(context)
                                                .appTheme
                                                .primary))
                                .inkWell(onTap: () {
                              setState(() {
                                isHide = !isHide;
                              });
                            })),
                        const VSpace(Insets.i25),
                        Center(
                                child: Container(
                                    alignment: Alignment.center,
                                    width: Sizes.s141,
                                    height: Sizes.s44,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color:
                                            appColor(context).appTheme.primary),
                                    child: Text(appFonts.signUp,
                                        style: appCss.dmDenseMedium16.textColor(
                                            appColor(context)
                                                .appTheme
                                                .whiteColor))))
                            .inkWell(onTap: () async {
                          if (emailSignUpPvr.formKey.currentState!.validate()) {
                            setState(() {});
                            try {
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: emailSignUpPvr.emailId.text,
                                password: emailSignUpPvr.password.text,
                              );
                              log("credential $credential");

                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                              emailSignUpPvr.emailId.text = "";
                              emailSignUpPvr.password.text = "";
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                log('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                log('The account already exists for that email.');
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
                        }),
                        const VSpace(Insets.i28),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/line11.svg"),
                              const HSpace(Insets.i8),
                              Text("Or", style: appCss.dmDenseMedium12),
                              const HSpace(Insets.i8),
                              SvgPicture.asset("assets/svg/line11.svg")
                            ]),
                        const VSpace(Insets.i20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            color: appColor(context)
                                                .appTheme
                                                .black
                                                .withOpacity(.2),
                                            blurRadius: 12,
                                            offset: const Offset(0, 4))
                                      ]),
                                  height: 46,
                                  width: 46,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(eSvgAssets.call)),
                              const HSpace(Insets.i15),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            color: appColor(context)
                                                .appTheme
                                                .black
                                                .withOpacity(.2),
                                            blurRadius: 12,
                                            offset: const Offset(0, 4))
                                      ]),
                                  height: 46,
                                  width: 46,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(eSvgAssets.fb)),
                              const HSpace(Insets.i15),
                              Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          boxShadow: [
                                            BoxShadow(
                                                color: appColor(context)
                                                    .appTheme
                                                    .black
                                                    .withOpacity(.2),
                                                blurRadius: 12,
                                                offset: const Offset(0, 4))
                                          ]),
                                      height: 46,
                                      width: 46,
                                      alignment: Alignment.center,
                                      child:
                                          SvgPicture.asset(eSvgAssets.google))
                                  .inkWell(onTap: () {
                                loginAuthPvr.signInWithGoogle(context);
                              }),
                              const HSpace(Insets.i15),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            color: appColor(context)
                                                .appTheme
                                                .black
                                                .withOpacity(.2),
                                            blurRadius: 12,
                                            offset: const Offset(0, 4))
                                      ]),
                                  height: 46,
                                  width: 46,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(eSvgAssets.apple))
                            ])
                      ]).paddingSymmetric(horizontal: Insets.i20),
                ),
                RichText(
                    text: TextSpan(
                        style: appCss.dmDenseSemiBold14
                            .textColor(appColor(context).appTheme.oneText),
                        children: [
                      TextSpan(text: appFonts.alreadyHaveAccount),
                      TextSpan(
                          text: appFonts.loginHere,
                          style: appCss.dmDenseSemiBold14
                              .textColor(appColor(context).appTheme.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                              emailSignUpPvr.emailId.text = "";
                              emailSignUpPvr.password.text = "";
                            })
                    ])).alignment(Alignment.bottomCenter)
              ])));
    });
  }
}

/*  EmailSignUpTextField(
                      hintText: appFonts.egMail,
                      text: appFonts.email,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailSignUpPvr.emailId,
                      dataPvr: emailSignUpPvr,
                      color: emailSignUpPvr.emailValid == null
                          ? const Color(0xff541F5C).withOpacity(.20)
                          : appColor(context).appTheme.red),
                  const VSpace(Insets.i20),
                  EmailSignUpTextField(
                      hintText: appFonts.egPass,
                      text: appFonts.password,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailSignUpPvr.password,
                      dataPvr: emailSignUpPvr,
                      color: emailSignUpPvr.passwordValid == null
                          ? const Color(0xff541F5C).withOpacity(.20)
                          : appColor(context).appTheme.red),*/
