import 'package:flutter_switch/flutter_switch.dart';
import '../../../../config.dart';

class HomePageReorderLayout extends StatelessWidget {
  const HomePageReorderLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(builder: (context, settingPvr, child) {
      return ReorderableListView(
          children: [
            for (final tile in appArray.homePageSectionList)
              Padding(
                  key: ValueKey(tile),
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                      decoration: BoxDecoration(
                          color: appColor(context).appTheme.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x1E929292),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                                spreadRadius: 0)
                          ]),
                      child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(tile['name'],
                              style: appCss.philosopherBold18.textColor(
                                  appColor(context).appTheme.rulesClr)),
                          leading: Container(
                              width: 20,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      topLeft: Radius.circular(8)),
                                  color:
                                      appColor(context).appTheme.containColor),
                              child: SvgPicture.asset(tile['svgImage'])
                                  .paddingSymmetric(
                                      vertical: 18, horizontal: 4)),
                          trailing: SizedBox(
                              height: 22,
                              width: 41,
                              child: FlutterSwitch(
                                  width: Sizes.s41,
                                  height: Sizes.s23,
                                  padding: 3,
                                  toggleSize: Sizes.s17,
                                  value: tile['isOn'],
                                  activeColor: appColor(context).appTheme.primary,
                                  inactiveColor: appColor(context).appTheme.lightText,
                                  borderRadius: 40.0,
                                  onToggle: (val) => settingPvr.onToggle(val, tile))).paddingSymmetric(horizontal: 12))))
          ],
          onReorder: (oldIndex, newIndex) =>
              settingPvr.onReorder(oldIndex, newIndex));
    });
  }
}
