import 'dart:convert';
import 'dart:developer';

import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/models/user_model.dart';
import 'package:bhakti_app/providers/common_api_provider.dart';
import 'package:bhakti_app/screens/home_screen/home_screen.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/setup_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailLoginProvider extends ChangeNotifier {
  TextEditingController emailId = TextEditingController();
  TextEditingController password = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false, isValid = false, isHide = true;
  SharedPreferences? preferences;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool value = false;
  String? passwordValid, emailValid;
  final formKey = GlobalKey<FormState>();

  emailValidator(value) {
    notifyListeners();
    if (value!.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      emailValid = appFonts.enterValidEmail;
      return appFonts.enterValidEmail;
    } else {
      emailValid = null;
      return null;
    }
  }

  passwordValidator(value) {
    notifyListeners();
    if (value!.isEmpty ||
        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(value)) {
      passwordValid = appFonts.enterValidEmail;
      return 'Enter a valid Password!';
    } else {
      passwordValid = null;
      return null;
    }
  }

  isPasswordHide() {
    notifyListeners();
    isHide = !isHide;
  }

  forgotPassword() {}

  loginButton(context) async {
    if (formKey.currentState!.validate()) {
      notifyListeners();
      try {
        isLoading = true;
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailId.text, password: password.text);

        String? token = await credential.user!.getIdToken();

        final commonApi =
            Provider.of<CommonApiProvider>(context, listen: false);

        await commonApi.socialLogin(context, token);

        isValid = false;
        notifyListeners();
        preferences = await SharedPreferences.getInstance();
        UserModel? userModel;

        await Future.delayed(Durations.s2);
        userModel = UserModel.fromJson(
            json.decode(preferences!.getString(session.user)!));
        debugPrint("userModel ${userModel.name}");
        isLoading = false;
        notifyListeners();
        if (userModel.name == null) {
          log("GFHFGGHNFGH");
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const SetUpProfile();
          }));
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const HomeScreen();
          }));
        }
        log("credential $credential");
        // ignore: use_build_context_synchronously
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("No user found for that email")));
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Wrong password provided for that user.")));
        }
        isValid = true;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
