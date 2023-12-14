import 'package:bhakti_app/config.dart';

class BottomNavProvider with ChangeNotifier {
  List dashList = [];

  TabController? tabController;

  onTapTab(val) {
    tabController!.index = val;
    notifyListeners();
  }

  onInit(TickerProvider sync) {
    dashList = appArray.bottomNavyList;
    notifyListeners();
    tabController = TabController(length: dashList.length, vsync: sync);
  }


  final List<Widget> screens = [
    const HomeScreen(),
    const DashBoardScreen(),
    const MonitoringScreen(),
    const SettingScreen()
  ];


}
