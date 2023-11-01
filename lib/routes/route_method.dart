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
    // routeName.verifyOtp :(p0) => VerifyOtpScreen(),
    // routeName.forgetPassword :(p0) => ForgotPasswordScreen(),
    // routeName.resetPass :(p0) => ResetPasswordScreen(),
    // routeName.registerUser :(p0) => RegisterScreen(),
    // routeName.dashboard :(p0) => Dashboard(),
    // routeName.changePass :(p0) => ChangePasswordScreen(),
    // routeName.appSetting :(p0) => AppSettingScreen(),
    //
    // routeName.changeLanguage :(p0) => ChangeLanguageScreen(),
    //
    // routeName.changeLanguage:(p0) => ChangeLanguageScreen(),
    // routeName.profileDetail:(p0) => ProfileDetailScreen(),
    // routeName.walletBalance:(p0) => WalletBalanceScreen(),
    // routeName.favoriteList:(p0) => FavouriteListScreen(),
    // routeName.myLocation:(p0) => MyLocationScreen(),
    // routeName.review:(p0) => ReviewScreen(),
    // routeName.editReview:(p0) => EditReviewScreen(),
    // routeName.appDetails:(p0) => AppDetailsScreen(),
    // routeName.rateApp:(p0) => RateAppScreen(),
    // routeName.contactUs:(p0) => ContactUsScreen(),
    // routeName.helpSupport:(p0) => HelpSupportScreen(),


  };


}
