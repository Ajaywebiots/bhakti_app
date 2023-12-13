import 'package:bhakti_app/config.dart';

import '../screens/home_screen/setting_screen/layouts/setting_dialog_layout.dart';

class SettingProvider extends ChangeNotifier {
  TextEditingController? numberOfRound, averageTime, searchBookHere, searchUser;

  tabControl(index) {
    notifyListeners();
    index = 0;
  }

  onTap(dataInt, context, data) {
    dataInt == 4
        ? showDialog(
            context: context,
            builder: (context) {
              return const SettingDialogLayout();
            })
        : Navigator.push(context, MaterialPageRoute(builder: (context) {
            return data!['navigate'];
          }));
  }

  onNotificationToggle(val, data) {
    notifyListeners();
    data['isOn'] = val;
  }

  TextEditingController? accessKey;

  onSelected(context, value) {
    if (value == 1) {
      Navigator.pop(context);
    } else if (value == 2) {
      showDialog(
          context: context,
          builder: (context) {
            return const ShareMySadhanaDialog();
          });
    }
  }

  onToggle(val, tile) {
    notifyListeners();
    tile['isOn'] = val;
  }

  void updateMyTiles(int oldIndex, int newIndex) {
    notifyListeners();
    // this adjustment is needed when moving down the list
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    // get the tile we are moving
    final Map<String, dynamic> tile =
        appArray.homePageSectionList.removeAt(oldIndex);
    // place the tile in new position
    appArray.homePageSectionList.insert(newIndex, tile);
  }

  onReorder(oldIndex, newIndex) {
    notifyListeners();
    updateMyTiles(oldIndex, newIndex);
  }
}
