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
}
