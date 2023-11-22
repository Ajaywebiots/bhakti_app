import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/bottom_nav_provider.dart';
import 'package:bhakti_app/screens/home_screen/layouts/list_model.dart';
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
    final dashPvr = Provider.of<BottomNavProvider>(context, listen: true);
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
              SvgPicture.asset("assets/svg/arrowLeft.svg").inkWell(onTap: () {
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                            children: settingList
                                .asMap()
                                .entries
                                .map((e) {
                              return Column(children: [
                                SettingListLayouts(
                                    isShare: false,
                                    onTap: () {
                                      e.key == 4
                                          ? showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(8)),
                                                child: SizedBox(
                                                    height: 190,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Center(
                                                              child: Text(
                                                                  "Bhakti Steps Access Key",
                                                                  style: appCss
                                                                      .philosopherBold18
                                                                      .textColor(
                                                                      appColor(
                                                                          context)
                                                                          .appTheme
                                                                          .primary))),
                                                          const VSpace(
                                                              Insets.i10),
                                                          Center(
                                                              child: Text(
                                                                  "This Access key will provide you access of",
                                                                  style: appCss
                                                                      .dmDenseRegular14
                                                                      .textColor(
                                                                      appColor(
                                                                          context)
                                                                          .appTheme
                                                                          .rulesClr))),
                                                          Center(
                                                              child: Text(
                                                                  style: appCss
                                                                      .dmDenseRegular14
                                                                      .textColor(
                                                                      appColor(
                                                                          context)
                                                                          .appTheme
                                                                          .rulesClr),
                                                                  "bhakti steps application you can copy and")),
                                                          Center(
                                                              child: Text(
                                                                  style: appCss
                                                                      .dmDenseRegular14
                                                                      .textColor(
                                                                      appColor(
                                                                          context)
                                                                          .appTheme
                                                                          .rulesClr),
                                                                  "share the key...")),
                                                          const VSpace(
                                                              Insets.i25),
                                                          Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              children: [
                                                                Container(
                                                                    height: 40,
                                                                    width: 205,
                                                                    decoration: BoxDecoration(
                                                                        color: const Color(
                                                                            0x0FC35DD2),
                                                                        border: Border
                                                                            .all(
                                                                            color: appColor(
                                                                                context)
                                                                                .appTheme
                                                                                .primary
                                                                                .withOpacity(
                                                                                0.20)),
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                            8)),
                                                                    child:
                                                                    const TextField(
                                                                        readOnly:
                                                                        true,
                                                                        decoration: InputDecoration(
                                                                            hintText:
                                                                            '',
                                                                            disabledBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius
                                                                                    .all(
                                                                                    Radius
                                                                                        .circular(
                                                                                        AppRadius
                                                                                            .r8)),
                                                                                borderSide: BorderSide
                                                                                    .none),
                                                                            focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius
                                                                                    .all(
                                                                                    Radius
                                                                                        .circular(
                                                                                        AppRadius
                                                                                            .r8)),
                                                                                borderSide: BorderSide
                                                                                    .none),
                                                                            enabledBorder: OutlineInputBorder(
                                                                                borderRadius:
                                                                                BorderRadius
                                                                                    .all(
                                                                                    Radius
                                                                                        .circular(
                                                                                        AppRadius
                                                                                            .r8)),
                                                                                borderSide: BorderSide
                                                                                    .none),
                                                                            border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius
                                                                                    .all(
                                                                                    Radius
                                                                                        .circular(
                                                                                        AppRadius
                                                                                            .r8)),
                                                                                borderSide: BorderSide
                                                                                    .none))
                                                                    )),
                                                                const HSpace(
                                                                    Insets.i10),
                                                                Container(
                                                                    height: 40,
                                                                    padding:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                                    width: 40,
                                                                    decoration: BoxDecoration(
                                                                        color: const Color(
                                                                            0x0FC35DD2),
                                                                        border: Border
                                                                            .all(
                                                                            color: appColor(
                                                                                context)
                                                                                .appTheme
                                                                                .primary
                                                                                .withOpacity(
                                                                                0.20)),
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                            8)),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                        "assets/svg/documentcopy.svg")
                                                                ),
                                                                const HSpace(
                                                                    Insets.i10),
                                                                Container(
                                                                    height: 40,
                                                                    padding:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                                    width: 40,
                                                                    decoration: BoxDecoration(
                                                                        color: const Color(
                                                                            0x0FC35DD2),
                                                                        border: Border
                                                                            .all(
                                                                            color: appColor(
                                                                                context)
                                                                                .appTheme
                                                                                .primary
                                                                                .withOpacity(
                                                                                0.20)),
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                            8)),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                        "assets/svg/SharemySadhana.svg"))
                                                              ])
                                                        ])));
                                          })
                                          : Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return e.value['navigate'];
                                          }));
                                    },
                                    index: e.key,
                                    widget: SvgPicture.asset(
                                        "assets/svg/arrow_left_to_right.svg"),
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
