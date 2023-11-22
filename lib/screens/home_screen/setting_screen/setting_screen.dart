import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/bottom_nav_provider.dart';
import 'package:bhakti_app/screens/home_screen/layouts/list_model.dart';
import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/homepage_section_priorities.dart';
import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/setting_list_layouts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final dashPvr = Provider.of<BottomNavProvider>(context,listen: true);
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
                  .inkWell(onTap: () {
                dashPvr.tabController!.index = 0;
                dashPvr.notifyListeners();
              }),
              const HSpace(Insets.i120),
              Text("Setting",
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
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const VSpace(Insets.i120),
            Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: appColor(context).appTheme.whiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: appColor(context).appTheme.shadowClr,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                          spreadRadius: 0)
                    ]),
                child: Column(
                        children: settingList.asMap().entries.map((e) {
                  return Column(children: [
                    SettingListLayouts(

                        isShare: false,
                        onTap: () => Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return HomePageSection()/*e.value['navigate']*/;
                              },
                            )),
                        index: e.key,

                       widget: SvgPicture.asset("assets/svg/arrow_left_to_right.svg"),
                        list: settingList,
                        svgImage: e.value['image'],
                        text: e.value['rule'])
                  ]);
                }).toList())
                    .paddingSymmetric(vertical: Insets.i10))
          ]).paddingSymmetric(horizontal: 20))
        ]));
  }
}
