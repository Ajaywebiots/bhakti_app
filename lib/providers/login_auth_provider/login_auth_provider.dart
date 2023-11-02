import 'dart:developer';
import 'package:bhakti_app/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class LoginAuthProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  String userNameGoogle = "";

  Future<UserCredential> signInWithGoogle() async {
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

    var url = Uri.parse('https://api.sadhanasheet.com/v1/ExchangeToken');
    var response = await http
        .post(url, body: {'FirebaseAccessToken': googleAuth!.accessToken});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print('googleAuth refreshToken: ${user.refreshToken}');

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
