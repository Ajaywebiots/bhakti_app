import 'dart:convert';
import 'dart:developer';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/auth_screen/email_login_screen/email_login_screen.dart';
import 'package:bhakti_app/screens/auth_screen/phone_login_screen/phone_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bhakti_app/models/user_model.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bhakti_app/screens/home_screen/home_screen.dart';
import 'package:bhakti_app/screens/home_screen/setup_profile/setup_profile.dart';
import 'package:bhakti_app/providers/common_api_provider.dart';

class LoginAuthProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  String userNameGoogle = "";

  signInWithGoogle(context) async {
    // Trigger the authentication flow
    SharedPreferences? preferences;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    log("googleUser :: $googleUser");
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    log("googleAuth :: $googleAuth");
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    log("credential :: $credential");

    User? user = (await auth.signInWithCredential(credential)).user;
    notifyListeners();
    userNameGoogle = user!.email!;

    String? token = await user.getIdToken();

    final commonApi = Provider.of<CommonApiProvider>(context, listen: false);

    await commonApi.socialLogin(context, token);

    preferences = await SharedPreferences.getInstance();
    UserModel? userModel;

//Map user = json.decode(preferences!.getString(session.user)!);
    await Future.delayed(Durations.s2);
    userModel =
        UserModel.fromJson(json.decode(preferences.getString(session.user)!));
    debugPrint("userModel ${userModel.name}");
    if (userModel.name == null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const SetUpProfile();
      }));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
    }

    // var url = Uri.parse('https://api.sadhanasheet.com/v1/ExchangeToken');
    // var response = await http.post(url, body: {
    //   'FirebaseAccessToken': token,
    // });
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    //
    // SharedPreferences prefs =await SharedPreferences.getInstance();
    //
    //
    // prefs.setString("accessToken", response.body[]);

    // Once signed in, return the UserCredential
  }

  loginPhoneNavigator(context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return const PhoneLoginScreen();
    }));
  }

  Future<Resource?> signInWithFacebook(context) async {
    // SharedPreferences? preferences;
    // try {
    //   final LoginResult result = await FacebookAuth.instance.login();
    //   switch (result.status) {
    //     case LoginStatus.success:
    //       final AuthCredential facebookCredential =
    //           FacebookAuthProvider.credential(result.accessToken!.token);
    //       final userCredential =
    //           await auth.signInWithCredential(facebookCredential);
    //       User? user =
    //           (await auth.signInWithCredential(facebookCredential)).user;
    //       notifyListeners();
    //       userNameGoogle = user!.email!;
    //
    //       String? token = await user.getIdToken();
    //
    //       final commonApi =
    //           Provider.of<CommonApiProvider>(context, listen: false);
    //
    //       await commonApi.socialLogin(context, token);
    //
    //       preferences = await SharedPreferences.getInstance();
    //       UserModel? userModel;
    //       await Future.delayed(Durations.s2);
    //       userModel = UserModel.fromJson(
    //           json.decode(preferences.getString(session.user)!));
    //       debugPrint("userModel ${userModel.name}");
    //       if (userModel.name == null) {
    //         Navigator.pushReplacement(context,
    //             MaterialPageRoute(builder: (context) {
    //           return const SetUpProfile();
    //         }));
    //       } else {
    //         Navigator.pushReplacement(context,
    //             MaterialPageRoute(builder: (context) {
    //           return const HomeScreen();
    //         }));
    //       }
    //
    //       return Resource(status: Status.Success);
    //     case LoginStatus.cancelled:
    //       return Resource(status: Status.Cancelled);
    //     case LoginStatus.failed:
    //       return Resource(status: Status.Error);
    //     default:
    //       return null;
    //   }
    // } on FirebaseAuthException catch (e) {
    //   throw e;
    // }
  }

  loginEmailNavigator(context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return const EmailLoginScreen();
    }));
  }
}

class Resource {
  final Status status;

  Resource({required this.status});
}

enum Status { Success, Error, Cancelled }
