import 'package:bhakti_app/config.dart';

class SettingProvider extends ChangeNotifier {
  void updateMyTiles(int oldIndex, int newIndex) {
    notifyListeners();
    // this adjustment is needed when moving down the list
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    // get the tile we are moving
    final Map<String, dynamic> tile = appArray.homePageSectionList.removeAt(oldIndex);
    // place the tile in new position
    appArray.homePageSectionList.insert(newIndex, tile);
  }

}
