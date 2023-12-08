import 'package:bhakti_app/config.dart';

class CommonBottomNavigationBar extends StatefulWidget {
  const CommonBottomNavigationBar({super.key});

  @override
  State<CommonBottomNavigationBar> createState() =>
      _CommonBottomNavigationBarState();
}

class _CommonBottomNavigationBarState extends State<CommonBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<BottomNavProvider, HomeScreenProvider>(
        builder: (context, bottomNavPrv, homeScreenPvr, child) {
      return Scaffold(
          key: homeScreenPvr.key,
          drawer: const DrawerScreen(),
          body: DefaultTabController(
              length: bottomNavPrv.dashList.length,
              child: Scaffold(
                  // Tab bar view
                  body: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: bottomNavPrv.tabController,
                      children: bottomNavPrv.screens),
                  // All tabs
                  bottomNavigationBar: const BottomNavBar(),
                  backgroundColor: appColor(context).appTheme.primary)));
    });
  }
}
