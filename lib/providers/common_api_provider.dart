//self api
import 'dart:convert';
import 'dart:developer';

import 'package:bhakti_app/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bhakti_app/models/user_model.dart';

class CommonApiProvider extends ChangeNotifier {
  socialLogin(context, token) async {
    notifyListeners();

    var body = {
      'FirebaseAccessToken': token,
    };

    log("body : $body");
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      await apiServices.postApi(api.exchangeToken, body).then((value) async {
        notifyListeners();
        if (value.isSuccess!) {
          await pref.setString(session.accessToken, value.data['AccessToken']);
          await pref.setString(session.id, value.data['uid']);
          notifyListeners();
          await selfApi(context);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.message)));
        }
      });
    } catch (e) {
      notifyListeners();
      log("CATCH : $e");
    }
  }

  selfApi(context) async {
    var body = {};
    SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      await apiServices.getApi(api.getProfile, [], isToken: true).then((value) {
        if (value.isSuccess!) {
          log("DDD");
          pref.setString(
              session.user, json.encode(UserModel.fromJson(value.data)));
          notifyListeners();
          userModel = UserModel.fromJson(value.data);
          log("DDD1");
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }
}
