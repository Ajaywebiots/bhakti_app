import 'dart:developer';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/common_api_provider/Common_api_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../screens/home_screen/setup_profile/setup_profile.dart';

class LoginAuthProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  String userNameGoogle = "";

  signInWithGoogle(context) async {
    // Trigger the authentication flow
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

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SetUpProfile()));
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
}
