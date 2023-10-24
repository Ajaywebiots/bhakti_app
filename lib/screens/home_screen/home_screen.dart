import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/home_screen_provider/home_screen_provider.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_circle_design_layout.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_container.dart';
import 'package:bhakti_app/screens/home_screen/layouts/regulation_list_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context1, value, child) {
      return SafeArea(
          child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                  centerTitle: false,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Row(children: [
                    SvgPicture.asset(
                      eSvgAssets.menu,
                      height: Insets.i32,
                      width: Insets.i32,
                    ).paddingSymmetric(vertical: 10),
                    const HSpace(Sizes.s10),
                    Image.asset(eImageAssets.bhaktiLogo, height: 30, width: 136)
                  ]),
                  actions: [
                    SvgPicture.asset(eSvgAssets.chat),
                    const HSpace(Sizes.s10),
                    SvgPicture.asset(eSvgAssets.calendar),
                    const HSpace(Sizes.s10),
                    Image.asset(eImageAssets.img, height: Insets.i32),
                    const HSpace(Sizes.s20)
                  ],
                  leadingWidth: 0),
              body: Stack(alignment: Alignment.center, children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(eImageAssets.splashBg)))),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(appFonts.sleep, style: appCss.philosopherBold18),
                      const VSpace(Sizes.s15),
                      Row(children: [
                        Expanded(
                          child: Stack(children: [
                            CommonContainer(
                                text: appFonts.sleptAt,
                                timeText: '10:30 PM',
                                svgImage: eSvgAssets.sleptTimeIcon),
                            const Positioned(
                                left: 64,
                                top: 7,
                                child: CommonCircleDesign(
                                    height: Sizes.s6, width: Sizes.s6)),
                            const Positioned(
                                left: 133,
                                top: 54,
                                child: CommonCircleDesign(
                                    height: Sizes.s6, width: Sizes.s6)),
                            const Positioned(
                                left: 110,
                                bottom: 9,
                                child: CommonCircleDesign(
                                    height: Sizes.s6, width: Sizes.s6)),
                            const Positioned(
                                left: 132,
                                top: 3,
                                child: CommonCircleDesign(
                                    height: Sizes.s10, width: Sizes.s10)),
                            const Positioned(
                                left: 142,
                                top: 29,
                                child: CommonCircleDesign(
                                    height: Sizes.s10, width: Sizes.s10)),
                            const Positioned(
                                left: 100,
                                top: 52,
                                child: CommonCircleDesign(
                                    height: Sizes.s10, width: Sizes.s10))
                          ]),
                        ),
                        const HSpace(Sizes.s15),
                        Expanded(
                          child: Stack(children: [
                            CommonContainer(
                                text: appFonts.wokeUpAt,
                                timeText: '04:30 AM',
                                svgImage: eSvgAssets.wokeTime),
                            const Positioned(
                                right: 58,
                                top: 11,
                                child: CommonCircleDesign(
                                    height: Sizes.s6, width: Sizes.s6)),
                            const Positioned(
                                right: 57,
                                bottom: 26,
                                child: CommonCircleDesign(
                                    height: Sizes.s6, width: Sizes.s6)),
                            const Positioned(
                                right: 74,
                                bottom: 9,
                                child: CommonCircleDesign(
                                    height: Sizes.s6, width: Sizes.s6)),
                            const Positioned(
                                right: 18,
                                top: 13,
                                child: CommonCircleDesign(
                                    height: Sizes.s10, width: Sizes.s10)),
                            const Positioned(
                                right: 4,
                                top: 30,
                                child: CommonCircleDesign(
                                    height: Sizes.s10, width: Sizes.s10)),
                            const Positioned(
                                left: 70,
                                bottom: 36,
                                child: CommonCircleDesign(
                                    height: Sizes.s10, width: Sizes.s10))
                          ]),
                        )
                      ]).paddingOnly(),
                      const VSpace(Sizes.s25),
                      Text(appFonts.worship, style: appCss.philosopherBold18),
                      const VSpace(Sizes.s15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Stack(children: [
                              CommonContainer(
                                  text: appFonts.mangalaArti,
                                  timeText: '10:30 AM',
                                  svgImage: eSvgAssets.mangalaAarti),
                              const Positioned(
                                  right: 58,
                                  top: 11,
                                  child: CommonCircleDesign(
                                      height: Sizes.s6, width: Sizes.s6)),
                              const Positioned(
                                  right: 21,
                                  top: 4,
                                  child: CommonCircleDesign(
                                      height: Sizes.s10, width: Sizes.s10)),
                              const Positioned(
                                  left: 70,
                                  bottom: 36,
                                  child: CommonCircleDesign(
                                      height: Sizes.s10, width: Sizes.s10))
                            ])),
                            const HSpace(Sizes.s15),
                            Expanded(
                                child: Stack(children: [
                              CommonContainer(
                                  text: appFonts.sandhyaArti,
                                  timeText: '',
                                  svgImage: eSvgAssets.sandhyaArti),
                              const Positioned(
                                  right: 58,
                                  top: 11,
                                  child: CommonCircleDesign(
                                      height: Sizes.s6, width: Sizes.s6)),
                              const Positioned(
                                  right: 27,
                                  top: 5,
                                  child: CommonCircleDesign(
                                      height: Sizes.s10, width: Sizes.s10)),
                              const Positioned(
                                  right: 10,
                                  bottom: 9,
                                  child: CommonCircleDesign(
                                      height: Sizes.s10, width: Sizes.s10)),
                              const Positioned(
                                  left: 70,
                                  bottom: 36,
                                  child: CommonCircleDesign(
                                      height: Sizes.s10, width: Sizes.s10))
                            ])),
                          ]),
                      const VSpace(Sizes.s25),
                      Text(appFonts.chanting, style: appCss.philosopherBold18),
                      const VSpace(Sizes.s15),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: appColor(context).appTheme.whiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color: appColor(context)
                                            .appTheme
                                            .shadowClr,
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                        spreadRadius: 0)
                                  ],
                                ),
                                height: Sizes.s86,
                                width: Sizes.s106,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SvgPicture.asset(
                                                eSvgAssets.chanting),
                                            Text("8",
                                                style: appCss.dmDenseBold24
                                                    .textColor(appColor(context)
                                                        .appTheme
                                                        .primary))
                                          ]),
                                      Text("Before 6:30 am",
                                          style: appCss.dmDenseMedium11
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .lightText))
                                    ])),
                            const HSpace(Sizes.s10),
                            Container(
                                decoration: BoxDecoration(
                                    color:
                                        appColor(context).appTheme.whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          color: appColor(context)
                                              .appTheme
                                              .shadowClr,
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                          spreadRadius: 0)
                                    ]),
                                height: Sizes.s86,
                                width: Sizes.s106,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SvgPicture.asset(
                                                eSvgAssets.chanting),
                                            Text("4",
                                                style: appCss.dmDenseBold24
                                                    .textColor(appColor(context)
                                                        .appTheme
                                                        .primary))
                                          ]),
                                      Text("Before 8:30 am",
                                          style: appCss.dmDenseMedium11
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .lightText))
                                    ])),
                            const HSpace(Sizes.s10),
                            Container(
                                decoration: BoxDecoration(
                                    color:
                                        appColor(context).appTheme.whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          color: appColor(context)
                                              .appTheme
                                              .shadowClr,
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                          spreadRadius: 0)
                                    ]),
                                height: Sizes.s86,
                                width: Sizes.s106,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SvgPicture.asset(
                                                eSvgAssets.chanting),
                                            Text("8",
                                                style: appCss.dmDenseBold24
                                                    .textColor(appColor(context)
                                                        .appTheme
                                                        .primary))
                                          ]),
                                      Text("Before 10:00 am",
                                          style: appCss.dmDenseMedium11
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .lightText))
                                    ])),
                            const HSpace(Sizes.s10),
                            Container(
                                decoration: BoxDecoration(
                                    color:
                                        appColor(context).appTheme.whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          color: appColor(context)
                                              .appTheme
                                              .shadowClr,
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                          spreadRadius: 0)
                                    ]),
                                height: Sizes.s86,
                                width: Sizes.s106,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SvgPicture.asset(
                                                eSvgAssets.chanting),
                                            Text("4",
                                                style: appCss.dmDenseBold24
                                                    .textColor(appColor(context)
                                                        .appTheme
                                                        .primary))
                                          ]),
                                      Text("Before 10:00 am",
                                          style: appCss.dmDenseMedium11
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .lightText))
                                    ]))
                          ])),
                      const VSpace(Sizes.s25),
                      Text(appFonts.regulations,
                          style: appCss.philosopherBold18),
                      const VSpace(Sizes.s15),
                      Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                color: appColor(context).appTheme.whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          appColor(context).appTheme.shadowClr,
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                      spreadRadius: 0)
                                ],
                              ),
                              width: 335,
                              height: 220,
                              child: ListView.builder(
                                  itemCount: rulesList.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                    BoxShadow(
                                        color: appColor(context)
                                            .appTheme
                                            .shadowClr,
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                        spreadRadius: 0)
                                  ],
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                          Row(children: [
                                            Text(rulesList[index]['rule'],
                                                style: appCss.dmDenseMedium16
                                                    .textColor(appColor(context)
                                                        .appTheme
                                                        .rulesClr))
                                          ]),
                                          index == 4
                                              ? Container()
                                              : SvgPicture.asset(
                                                  eSvgAssets.lineRuler)
                                        ]));
                                  })))
                    ]).paddingOnly(
                    top: MediaQuery.of(context).size.height / 10,
                    left: Insets.i20,
                    right: Insets.i20)
              ])));
    });
  }
}
