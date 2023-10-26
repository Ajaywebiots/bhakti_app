import 'dart:developer';
import 'package:bhakti_app/providers/home_screen_provider/home_screen_provider.dart';
import 'package:bhakti_app/providers/login_screen_provider/login_screen_provider.dart';
import 'package:bhakti_app/providers/setup_profile_provider/setup_profile_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/assets/index.dart';
import 'common/theme/app_theme.dart';
import 'config.dart';

void main() async {
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
                  ChangeNotifierProvider(create: (_) => LoginScreenProvider()),
                  ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
                  ChangeNotifierProvider(create: (_) => SetUpProfileProvider()),
                ],
                child: Consumer<ThemeService>(builder: (context, theme, child) {
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
                          image: AssetImage(eImageAssets.splashBg))),
                ));
          }
        });
  }
}
