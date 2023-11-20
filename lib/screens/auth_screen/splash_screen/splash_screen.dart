import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/models/user_model.dart';
import 'package:bhakti_app/screens/auth_screen/login_auth_screen/login_auth_screen.dart';
import 'package:bhakti_app/screens/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      checkLocalData();
    });
  }

  checkLocalData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString(session.user) != null) {
       userModel =
          UserModel.fromJson(json.decode(pref.getString(session.user)!));
      log("MODE l:$userModel");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginAuthScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(bottom: Insets.i27),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(eImageAssets.splashBg))),
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Center(
                        child: Image.asset(eImageAssets.bhaktiImg,
                            fit: BoxFit.cover, height: 265)),
                    const VSpace(Insets.i55),
                    Image.asset(eImageAssets.bhaktiLogo, height: Sizes.s70),
                    const VSpace(Insets.i8),
                    Text(appFonts.sadhanaSheet,
                        style: appCss.philosopherBold28
                            .textColor(const Color(0xff3d3d3d))
                            .letterSpace(6))
                  ])),
              Text(appFonts.copyRight,
                  style: appCss.dmDenseSemiBold14
                      .textColor(appColor(context).appTheme.lightText))
            ])));
  }
}
