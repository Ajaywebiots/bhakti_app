//app file

import 'package:bhakti_app/screens/auth_screen/splash_screen/splash_screen.dart';
import 'package:bhakti_app/screens/home_screen/home_screen.dart';

import '../config.dart';


class AppRoute {

  Map<String, Widget Function(BuildContext)> route = {
    routeName.splash :(p0) => const SplashScreen(),
    routeName.homeScreen :(p0) => const HomeScreen(),
    // routeName.login :(p0) => EmailLoginScreen(),
    // routeName.loginWithPhone :(p0) => LoginWithPhoneScreen(),

  };


}
