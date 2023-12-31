import 'dart:developer';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/auth_screen/email_sign_up_screen/email_sign_up_screen.dart';
import 'package:bhakti_app/screens/auth_screen/phone_login_screen/phone_login_screen.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/setup_profile.dart';
import '../../screens/home_screen/common_bottom_bar/common_bottom_bar.dart';

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

  signUpNavigate(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const EmailSignUpScreen();
    }));
  }

  phoneLoginNavigate(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const PhoneLoginScreen();
    }));
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

        await Future.delayed(DurationsClass.s2);
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
          emailId.text = "";
          password.text = "";
        } else {
          log('LOGGEDEee');
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const CommonBottomNavigationBar();
          }));
          emailId.text = "";
          password.text = "";
        }
        log("credential $credential");
        // ignore: use_build_context_synchronously
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(appFonts.noUserFound,
                  style: appCss.dmDenseRegular16
                      .textColor(appColor(context).appTheme.primary))));
        } else if (e.code == appFonts.wrongPassword) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 1),
              content: Text(
                appFonts.wrongPasswordProvided,
                style: appCss.dmDenseRegular16
                    .textColor(appColor(context).appTheme.primary),
              )));
        }
        isValid = true;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      }
    }
    emailId.text = "";
    password.text = "";
  }
}
