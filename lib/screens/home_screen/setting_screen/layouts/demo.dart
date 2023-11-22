import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/layouts/list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../common/theme/app_css.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of tiles


  // reorder method
  void updateMyTiles(int oldIndex, int newIndex) {
    setState(() {
      // this adjustment is needed when moving down the list
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      // get the tile we are moving
      final Map<String, dynamic> tile = homePageSectionList.removeAt(oldIndex);
      // place the tile in new position
      homePageSectionList.insert(newIndex, tile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        padding: const EdgeInsets.all(10),
        children: [
          for (final tile in homePageSectionList)
            Padding(
                key: ValueKey(tile),
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: Colors.grey[200],
                    child: ListTile(
                        title: Text(tile['name']),
                        leading: SvgPicture.asset(tile['svgImage']),
                        trailing: SizedBox(height: 22,width: 41,
                          child: FlutterSwitch(
                              width: Sizes.s41,
                              height: Sizes.s23,
                              padding: 3,
                              toggleSize: Sizes.s17,
                              value: true,
                              activeColor: appColor(context).appTheme.primary,
                              inactiveColor: appColor(context).appTheme.lightText,
                              borderRadius: 40.0,
                              onToggle: (val) {
                                tile['isOn'] = val;
                              }),
                        ))))
        ],
        onReorder: (oldIndex, newIndex) {
          updateMyTiles(oldIndex, newIndex);
        },
      ),
    );
  }
}
