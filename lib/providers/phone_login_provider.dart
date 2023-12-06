import 'dart:developer';
import 'package:bhakti_app/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/auth_screen/otp_screen/otp_screen.dart';
import '../screens/auth_screen/phone_login_screen/phone_login_screen.dart';

class PhoneLoginProvider extends ChangeNotifier {
  TextEditingController phoneNumber = TextEditingController();
  bool isLoading = false;
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String countryCode = "91";
  sendOtpButton(context) async {
    FocusScope.of(context)
        .requestFocus(FocusNode());
    isLoading = true;
    notifyListeners();
    log("number:::${"+${countryCode + phoneNumber.text}"}");
    await FirebaseAuth.instance
        .verifyPhoneNumber(
        phoneNumber:
        "+${countryCode + phoneNumber.text}",
        verificationCompleted:
            (PhoneAuthCredential
        credential) {
          isLoading = false;
          notifyListeners();
        },
        verificationFailed:
            (FirebaseAuthException e) {
          isLoading = false;
          notifyListeners();
        },
        codeSent: (String verificationId,
            int? resendToken) {
          PhoneLoginScreen.verify =
              verificationId;
          isLoading = false;
          notifyListeners();
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) {
                    return const OtpScreen();
                  }));
        },
        codeAutoRetrievalTimeout:
            (String verificationId) {
          isLoading = false;
         notifyListeners();
        });
  }


  validator(p0){
    if (p0!.number.isEmpty) {
      return 'Please Enter Your Number';
    }
    return null;
  }

  onCountryChanged(value){
    countryCode =
        value.dialCode;
  }
}
