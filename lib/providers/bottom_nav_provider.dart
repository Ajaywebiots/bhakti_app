import 'package:bhakti_app/config.dart';

import '../screens/home_screen/layouts/list_model.dart';

class BottomNavProvider with ChangeNotifier {
  List dashList = [];

  TabController? tabController;

  onTapTab(val) {
    tabController?.index = val;
    notifyListeners();
  }

  onInit(TickerProvider sync) {
    dashList = bottomNavyList;
    tabController = TabController(length: dashList.length, vsync: sync);
    notifyListeners();
  }
}
