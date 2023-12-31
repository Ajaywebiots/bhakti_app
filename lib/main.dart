import 'config.dart';
import 'dart:developer';
import 'package:bhakti_app/common/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';

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
                  ChangeNotifierProvider(
                      create: (_) => UpdateProfileProvider()),
                  ChangeNotifierProvider(create: (_) => BottomNavProvider()),
                  ChangeNotifierProvider(create: (_) => SettingProvider()),
                  ChangeNotifierProvider(create: (_) => DashboardProvider()),
                  ChangeNotifierProvider(create: (_) => MonitoringProvider()),
                  ChangeNotifierProvider(create: (_) => SplashScreenProvider())
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
