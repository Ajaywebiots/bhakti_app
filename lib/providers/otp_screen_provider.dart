import 'dart:convert';
import 'dart:developer';
import 'package:bhakti_app/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../screens/auth_screen/phone_login_screen/phone_login_screen.dart';
import '../screens/home_screen/common_bottom_bar/common_bottom_bar.dart';
import '../screens/home_screen/setup_profile/setup_profile.dart';
import 'common_api_provider.dart';

class OtpScreenProvider extends ChangeNotifier {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false, isValid = false;



  verifyButton(context) async {
    if (formKey.currentState!.validate()) {
      SharedPreferences? preferences;
      focusNode.unfocus();
      isLoading = true;
      notifyListeners();
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: PhoneLoginScreen.verify,
            smsCode: pinController.text);
        User? user = (await auth.signInWithCredential(credential)).user;
        log("credential::$credential");
        String? token = await user!.getIdToken();
        final commonApi =
            // ignore: use_build_context_synchronously
            Provider.of<CommonApiProvider>(context, listen: false);

        // ignore: use_build_context_synchronously
        await commonApi.socialLogin(context, token);
        isValid = false;
        notifyListeners();
        // ignore: use_build_context_synchronously

        preferences = await SharedPreferences.getInstance();
        UserModel? userModel;
//Map user = json.decode(preferences!.getString(session.user)!);
        await Future.delayed(DurationsClass.s2);
        if (preferences.getString(session.user) != null) {
          userModel = UserModel.fromJson(
              json.decode(preferences.getString(session.user)!));
          log("userModel ${userModel.name}");
          isLoading = false;
          notifyListeners();
          if (userModel.name == null) {
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const SetUpProfile();
            }));
          } else {
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const CommonBottomNavigationBar();
            }));
          }
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const SetUpProfile();
          }));
        }
      } on FirebaseAuthException catch (e) {
        log('failed userOtp: ${e.message.toString()}');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(appFonts.enterValidOTP)));
        isValid = true;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      }
    }
  }




  onCompleted(context,pin){
    debugPrint('onCompleted: $pin');
    FocusScope.of(context)
        .requestFocus(FocusNode());
  }

  onChanged(value,context){
    debugPrint('onChanged: ${value.length}');
    if (value.length == 6) {
      FocusScope.of(context)
          .requestFocus(FocusNode());
    }
  }


  validator(value){
    if (value == null || value.length != 6) {
      return 'Enter a 6-digit OTP';
    }
    return null;
  }


  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
