import 'package:bhakti_app/providers/common_api_provider/Common_api_provider.dart';

import 'config.dart';
import 'dart:developer';
import 'common/assets/index.dart';
import 'common/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/phone_screen_provider/phone_login_provider.dart';
import 'providers/email_login_screen_provider/email_login_screen_provider.dart';
import 'package:bhakti_app/providers/login_auth_provider/login_auth_provider.dart';
import 'package:bhakti_app/providers/otp_screen_provider/otp_screen_provider.dart';
import 'package:bhakti_app/providers/home_screen_provider/home_screen_provider.dart';
import 'package:bhakti_app/providers/email_sign_up_provider/email_sign_up_provider.dart';
import 'package:bhakti_app/providers/setup_profile_provider/setup_profile_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot<SharedPreferences> snapData) {
          if (snapData.hasData) {
            return MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                      create: (_) => ThemeService(snapData.data!)),
                  ChangeNotifierProvider(create: (_) => LoadingProvider()),
                  ChangeNotifierProvider(create: (_) => EmailLoginProvider()),
                  ChangeNotifierProvider(create: (_) => EmailSignUpProvider()),
                  ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
                  ChangeNotifierProvider(create: (_) => SetUpProfileProvider()),
                  ChangeNotifierProvider(create: (_) => LoginAuthProvider()),
                  ChangeNotifierProvider(create: (_) => PhoneLoginProvider()),
                  ChangeNotifierProvider(create: (_) => OtpScreenProvider()),
                  ChangeNotifierProvider(create: (_) => CommonApiProvider()),
                ],
                child: Consumer2<ThemeService, CommonApiProvider>(
                    builder: (context, theme, commonApi, child) {
                  log("THEME ${theme.isDarkMode}");
                  return MaterialApp(
                      title: 'Flutter Demo',
                      debugShowCheckedModeBanner: false,
                      theme: AppTheme.fromType(ThemeType.light).themeData,
                      darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
                      themeMode: theme.theme,
                      initialRoute: "/",
                      routes: appRoute.route);
                }));
          } else {
            return MaterialApp(
                theme: AppTheme.fromType(ThemeType.light).themeData,
                darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
                themeMode: ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: Container(
                    padding: const EdgeInsets.only(bottom: Insets.i27),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage(eImageAssets.splashBg)))));
          }
        });
  }
}
