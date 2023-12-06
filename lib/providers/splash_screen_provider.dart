import 'dart:convert';
import 'dart:developer';

import 'package:bhakti_app/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../screens/auth_screen/login_auth_screen/login_auth_screen.dart';
import '../screens/home_screen/common_bottom_bar/common_bottom_bar.dart';

class SplashScreenProvider extends ChangeNotifier{
  checkLocalData(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString(session.user) != null) {
      userModel =
          UserModel.fromJson(json.decode(pref.getString(session.user)!));
      log("MODE l:$userModel");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const CommonBottomNavigationBar()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginAuthScreen()));
    }
  }
}