import 'package:bhakti_app/config.dart';

class BottomNavProvider with ChangeNotifier {
  List dashList = [];

  TabController? tabController;

  onTapTab(val) {
    tabController?.index = val;
    notifyListeners();
  }

  onInit(TickerProvider sync) {
    dashList = appArray.bottomNavyList;
    tabController = TabController(length: dashList.length, vsync: sync);
    notifyListeners();
  }

  int currentTab = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const DashBoardScreen(),
    const MonitoringScreen(),
    const SettingScreen()
  ];

  void onItemTapped(int index) {
    notifyListeners();
    currentTab = index;
  }
}
