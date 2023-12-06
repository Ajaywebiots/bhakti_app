import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/bottom_nav_provider.dart';
import 'package:bhakti_app/providers/home_screen_provider.dart';
import 'package:bhakti_app/screens/home_screen/drawer_screen/drawer_screen.dart';
import 'package:bhakti_app/screens/home_screen/monitoring_screen/monitoring_screen.dart';
import 'package:bhakti_app/screens/home_screen/setting_screen/setting_screen.dart';

import '../dashboard_screen/dashboard_screen.dart';
import '../home_screen.dart';
import '../common_bottom_bar/bottom_nav_bar.dart';

class CommonBottomNavigationBar extends StatefulWidget {
  const CommonBottomNavigationBar({super.key});

  @override
  State<CommonBottomNavigationBar> createState() =>
      _CommonBottomNavigationBarState();
}

class _CommonBottomNavigationBarState extends State<CommonBottomNavigationBar> {
  int currentTab = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const DashBoardScreen(),
    const MonitoringScreen(),
    const SettingScreen()
  ];

  void onItemTapped(int index) {
    setState(() {
      currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<BottomNavProvider,HomeScreenProvider>(builder: (context, bottomNavPrv,homeScreenPvr, child) {
      return Scaffold(key: homeScreenPvr.key,
          drawer: const DrawerScreen(),
          body: DefaultTabController(
              length: bottomNavPrv.dashList.length,
              child: Scaffold(
                  // Tab bar view
                  body: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: bottomNavPrv.tabController,
                      children: screens),
                  // All tabs
                  bottomNavigationBar: const BottomNavBar(),
                  backgroundColor: appColor(context).appTheme.primary)));
    });
  }
}
