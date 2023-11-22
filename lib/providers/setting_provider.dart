import 'package:bhakti_app/config.dart';

import '../screens/home_screen/layouts/list_model.dart';

class SettingProvider extends ChangeNotifier {
  void updateMyTiles(int oldIndex, int newIndex) {
    notifyListeners();
    // this adjustment is needed when moving down the list
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    // get the tile we are moving
    final Map<String, dynamic> tile = homePageSectionList.removeAt(oldIndex);
    // place the tile in new position
    homePageSectionList.insert(newIndex, tile);
  }
}
