import 'dart:developer';

import 'package:bhakti_app/config.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailSignUpProvider extends ChangeNotifier {
  TextEditingController emailId = TextEditingController();
  TextEditingController password = TextEditingController();
  bool value = false;
  String? passwordValid, emailValid;
  final formKey = GlobalKey<FormState>();

  bool isHide = true;

  passwordTextField(value) {
    notifyListeners();
    if (value.isEmpty ||
        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(value)) {
      passwordValid = appFonts.enterValidEmail;
      return 'Enter a valid Password!';
    } else {
      passwordValid = null;
      return null;
    }
  }

  emailTextField(value) {
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

  isShowPassword(){
    notifyListeners();
    isHide = !isHide;
  }

  emailSignupNavigate(context) async {
    if (formKey.currentState!.validate()) {
      notifyListeners();
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailId.text,
          password: password.text,
        );
        log("credential $credential");
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        emailId.text = "";
        password.text = "";
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
  }
}
