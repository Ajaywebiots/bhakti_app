import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/setting_provider.dart';
import 'package:bhakti_app/screens/home_screen/layouts/list_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomePageSection extends StatelessWidget {
  const HomePageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(builder: (context, settingPvr, child) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
              leading: Container(),
              backgroundColor: Colors.transparent,
              titleSpacing: 0,
              leadingWidth: 0,
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const HSpace(Insets.i20),
                SvgPicture.asset("assets/svg/arrowLeft.svg")
                    .inkWell(onTap: () => Navigator.pop(context)),
                const HSpace(Insets.i40),
                Text(appFonts.homePageSection,
                    style: appCss.philosopherBold28
                        .textColor(appColor(context).appTheme.oneText))
              ])),
          body: Stack(alignment: Alignment.topLeft, children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(eImageAssets.splashBg)))),
            SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  const VSpace(Insets.i120),
                  Column(children: [
                    Container(
                      height: 580,
                      child: ReorderableListView(
                        children: [
                          for (final tile in homePageSectionList)
                            Padding(
                                key: ValueKey(tile),
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: appColor(context)
                                            .appTheme
                                            .whiteColor,
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
                                            style: appCss.philosopherBold18
                                                .textColor(appColor(context)
                                                    .appTheme
                                                    .rulesClr)),
                                        leading: Container(
                                            width: 20,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
                                                color: appColor(context)
                                                    .appTheme
                                                    .containColor),
                                            child: SvgPicture.asset(tile['svgImage'])
                                                .paddingSymmetric(vertical: 18, horizontal: 4)),
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
                                                onToggle: (val) {
                                                  settingPvr.notifyListeners();
                                                  tile['isOn'] = val;
                                                })).paddingSymmetric(horizontal: 12))))
                        ],
                        onReorder: (oldIndex, newIndex) {
                          settingPvr.updateMyTiles(oldIndex, newIndex);
                        },
                      ),
                    ),
                  ])
                ]).paddingSymmetric(horizontal: 20))
          ]));
    });
  }
}
