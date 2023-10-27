import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/ruler_picker/ruler_picker_bn.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/screens/home_screen/layouts/week_calendar.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_container.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_regulation.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_bottom_bar.dart';
import 'package:bhakti_app/screens/home_screen/layouts/regulation_list_model.dart';
import 'package:bhakti_app/screens/home_screen/layouts/chanting_common_layout.dart';
import 'package:bhakti_app/providers/home_screen_provider/home_screen_provider.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_circle_design_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int valueKG = 0;
  int valueCM = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context1, homeScreenPvr, child) {
      return SafeArea(
          child: Scaffold(
              bottomNavigationBar: const CommonBottomBar(),
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
                            fit: BoxFit.fill,
                            image: AssetImage(eImageAssets.splashBg)))),
                SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const VSpace(Sizes.s5),
                      const WeekCalendar(),
                      const VSpace(Sizes.s15),
                      Text(appFonts.sleep, style: appCss.philosopherBold18),
                      const VSpace(Sizes.s15),
                      Row(children: [
                        Expanded(
                            child: Stack(children: [
                          CommonContainer(
                              status: false,
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                          alignment: Alignment.center,
                                          child: Container(
                                              height: 367,
                                              width: 335,
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                        child: Text(
                                                            'Sleep Time',
                                                            style: appCss
                                                                .philosopherBold18
                                                                .textColor(appColor(
                                                                        context)
                                                                    .appTheme
                                                                    .primary))),
                                                    const VSpace(Insets.i20),
                                                    Text(
                                                        textAlign:
                                                            TextAlign.start,
                                                        'Hour',
                                                        style: appCss
                                                            .dmDenseMedium14
                                                            .textColor(appColor(
                                                                    context)
                                                                .appTheme
                                                                .primary)),
                                                    SizedBox(
                                                      width: 305,
                                                      height: 50,
                                                      child: RulerPicker(
                                                        onChange: (val) {
                                                          setState(() {
                                                            valueKG = val;
                                                          });
                                                        },
                                                        background:
                                                            Colors.white,
                                                        lineColor: appColor(context).appTheme.primary,
                                                        direction:
                                                            Axis.horizontal,
                                                        startValue: 70,
                                                        maxValue: 200,
                                                      ),
                                                    ),
                                                    const VSpace(Insets.i15),
                                                    Text(
                                                        textAlign:
                                                            TextAlign.start,
                                                        'Minutes',
                                                        style: appCss
                                                            .dmDenseMedium14
                                                            .textColor(appColor(
                                                                    context)
                                                                .appTheme
                                                                .primary)),
                                                    const VSpace(Insets.i30),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      width: 1,
                                                                      color: appColor(context)
                                                                          .appTheme
                                                                          .primary),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8)),
                                                              height: 44,
                                                              width: 120,
                                                              child: Text(
                                                                  "Cancel",
                                                                  style: appCss
                                                                      .dmDenseMedium14
                                                                      .textColor(appColor(context)
                                                                          .appTheme
                                                                          .primary))),
                                                          Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  color: appColor(
                                                                          context)
                                                                      .appTheme
                                                                      .primary),
                                                              height: 44,
                                                              width: 120,
                                                              child: Text(
                                                                  "Save",
                                                                  style: appCss
                                                                      .dmDenseMedium14
                                                                      .textColor(appColor(
                                                                              context)
                                                                          .appTheme
                                                                          .whiteColor)))
                                                        ])
                                                  ])));
                                    });
                              },
                              onToggle: (val) {},
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
                        ])),
                        const HSpace(Sizes.s15),
                        Expanded(
                            child: Stack(children: [
                          CommonContainer(
                              onTap: () {},
                              status: false,
                              onToggle: (val) {},
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
                        ]))
                      ]),
                      const VSpace(Sizes.s25),
                      Text(appFonts.worship, style: appCss.philosopherBold18),
                      const VSpace(Sizes.s15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Stack(children: [
                              CommonContainer(
                                  onTap: () {},
                                  text: appFonts.mangalaArti,
                                  timeText: '10:30 AM',
                                  status: false,
                                  onToggle: (val) {},
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
                                  onTap: () {},
                                  text: appFonts.sandhyaArti,
                                  timeText: '',
                                  onToggle: (value) {},
                                  status: true,
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
                            ]))
                          ]),
                      const VSpace(Sizes.s25),
                      Text(appFonts.chanting, style: appCss.philosopherBold18),
                      const VSpace(Sizes.s15),
                      const ChantingCommon(),
                      const VSpace(Sizes.s25),
                      Text(appFonts.regulations,
                          style: appCss.philosopherBold18),
                      const VSpace(Sizes.s15),
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
                              children: rulesList.asMap().entries.map((e) {
                            return Column(children: [
                              CommonRegulation(
                                  status: e.value['isOn'],
                                  text: e.value['rule'],
                                  onToggle: (val) {
                                    setState(() {
                                      e.value['isOn'] = val;
                                    });
                                  }),
                              const VSpace(Sizes.s10),
                              e.key == 4
                                  ? Container()
                                  : SvgPicture.asset(eSvgAssets.lineRuler),
                              e.key == 4 ? Container() : const VSpace(Sizes.s10)
                            ]);
                          }).toList())),
                      const VSpace(Sizes.s25),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(appFonts.books,
                                textAlign: TextAlign.start,
                                style: appCss.philosopherBold18),
                            Row(children: [
                              SvgPicture.asset(eSvgAssets.add),
                              Text('Add Book',
                                  style: appCss.dmDenseMedium14.textColor(
                                      appColor(context).appTheme.primary))
                            ])
                          ]),
                      const VSpace(Sizes.s15),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: bookList.asMap().entries.map((e) {
                            return Container(
                                margin: const EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                          color: appColor(context)
                                              .appTheme
                                              .shadowClr,
                                          blurRadius: 12,
                                          offset: const Offset(0, 2),
                                          spreadRadius: 0)
                                    ],
                                    color:
                                        appColor(context).appTheme.whiteColor),
                                height: Sizes.s179,
                                width: Sizes.s115,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(e.value['book'],
                                          height: Sizes.s132),
                                      const VSpace(Insets.i6),
                                      Text(e.value['time'],
                                          style: appCss.dmDenseMedium16
                                              .textColor(appColor(context)
                                                  .appTheme
                                                  .primary))
                                    ]));
                          }).toList())),
                      const VSpace(Sizes.s25),
                      Text(appFonts.association,
                          style: appCss.philosopherBold18),
                      const VSpace(Sizes.s15),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            Stack(children: [
                              Container(
                                  decoration: BoxDecoration(
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
                                      color: appColor(context)
                                          .appTheme
                                          .whiteColor),
                                  height: Sizes.s68,
                                  width: Sizes.s146,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  eSvgAssets.preaching),
                                              const HSpace(Insets.i8),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("01:00",
                                                        style: appCss
                                                            .dmDenseMedium16
                                                            .textColor(appColor(
                                                                    context)
                                                                .appTheme
                                                                .primary)),
                                                    Text("Preaching",
                                                        style: appCss
                                                            .dmDenseMedium14
                                                            .textColor(appColor(
                                                                    context)
                                                                .appTheme
                                                                .rulesClr))
                                                  ])
                                            ]).paddingOnly(left: 10, top: 4)
                                      ])),
                              const Positioned(
                                  right: 16,
                                  top: 7,
                                  child: CommonCircleDesign(
                                      height: Sizes.s6, width: Sizes.s6)),
                              const Positioned(
                                  left: 66,
                                  bottom: 2,
                                  child: CommonCircleDesign(
                                      height: Sizes.s10, width: Sizes.s10)),
                              const Positioned(
                                  left: 136,
                                  top: 61,
                                  child: CommonCircleDesign(
                                      height: Sizes.s10, width: Sizes.s10))
                            ]),
                            const HSpace(Insets.i15),
                            Stack(children: [
                              Container(
                                  decoration: BoxDecoration(
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
                                      color: appColor(context)
                                          .appTheme
                                          .whiteColor),
                                  height: Sizes.s68,
                                  width: Sizes.s146,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  eSvgAssets.preaching),
                                              const HSpace(Insets.i8),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("01:30",
                                                        style: appCss
                                                            .dmDenseMedium16
                                                            .textColor(appColor(
                                                                    context)
                                                                .appTheme
                                                                .primary)),
                                                    Text("Hearing",
                                                        style: appCss
                                                            .dmDenseMedium14
                                                            .textColor(appColor(
                                                                    context)
                                                                .appTheme
                                                                .rulesClr))
                                                  ])
                                            ]).paddingOnly(left: 10, top: 4)
                                      ])),
                              const Positioned(
                                  right: 14,
                                  top: 7,
                                  child: CommonCircleDesign(
                                      height: Sizes.s6, width: Sizes.s6)),
                              const Positioned(
                                  left: 60,
                                  top: 16.75,
                                  child: CommonCircleDesign(
                                      height: Sizes.s10, width: Sizes.s10)),
                              const Positioned(
                                  left: 100,
                                  top: 52,
                                  child: CommonCircleDesign(
                                      height: Sizes.s10, width: Sizes.s10))
                            ]),
                            const HSpace(Insets.i15),
                            Stack(children: [
                              Container(
                                  decoration: BoxDecoration(
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
                                      color: appColor(context)
                                          .appTheme
                                          .whiteColor),
                                  height: Sizes.s68,
                                  width: Sizes.s146,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  eSvgAssets.preaching),
                                              const HSpace(Insets.i8),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("01:30",
                                                        style: appCss
                                                            .dmDenseMedium16
                                                            .textColor(appColor(
                                                                    context)
                                                                .appTheme
                                                                .primary)),
                                                    Text("Chanting",
                                                        style: appCss
                                                            .dmDenseMedium14
                                                            .textColor(appColor(
                                                                    context)
                                                                .appTheme
                                                                .rulesClr))
                                                  ])
                                            ]).paddingOnly(left: 10, top: 4)
                                      ])),
                              const Positioned(
                                  left: 64,
                                  top: 7,
                                  child: CommonCircleDesign(
                                      height: Sizes.s6, width: Sizes.s6)),
                              const Positioned(
                                  left: 60,
                                  top: 16.75,
                                  child: CommonCircleDesign(
                                      height: Sizes.s10, width: Sizes.s10)),
                              const Positioned(
                                  left: 100,
                                  top: 52,
                                  child: CommonCircleDesign(
                                      height: Sizes.s10, width: Sizes.s10))
                            ])
                          ])),
                      const VSpace(Sizes.s25),
                      Text(appFonts.bookDistribution,
                          style: appCss.philosopherBold18),
                      const VSpace(Sizes.s15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
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
                                        color: appColor(context)
                                            .appTheme
                                            .whiteColor),
                                    height: Sizes.s86,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const HSpace(Insets.i8),
                                                SvgPicture.asset(eSvgAssets
                                                    .bookDistribution),
                                                const HSpace(Insets.i8),
                                                Text("10",
                                                    style: appCss
                                                        .dmDenseMedium16
                                                        .textColor(
                                                            appColor(context)
                                                                .appTheme
                                                                .primary)),
                                              ]),
                                          Text("Small Books",
                                                  style: appCss.dmDenseMedium12
                                                      .textColor(
                                                          appColor(context)
                                                              .appTheme
                                                              .lightText))
                                              .paddingOnly(left: 8)
                                        ]))),
                            const HSpace(Sizes.s10),
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
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
                                        color: appColor(context)
                                            .appTheme
                                            .whiteColor),
                                    height: Sizes.s86,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const HSpace(Insets.i8),
                                                SvgPicture.asset(eSvgAssets
                                                    .bookDistribution),
                                                const HSpace(Insets.i8),
                                                Text("5",
                                                    style: appCss
                                                        .dmDenseMedium16
                                                        .textColor(
                                                            appColor(context)
                                                                .appTheme
                                                                .primary))
                                              ]),
                                          Text("Medium Books",
                                                  style: appCss.dmDenseMedium12
                                                      .textColor(
                                                          appColor(context)
                                                              .appTheme
                                                              .lightText))
                                              .paddingOnly(left: 8)
                                        ]))),
                            const HSpace(Insets.i10),
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
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
                                        color: appColor(context)
                                            .appTheme
                                            .whiteColor),
                                    height: Sizes.s86,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const HSpace(Insets.i8),
                                                SvgPicture.asset(eSvgAssets
                                                    .bookDistribution),
                                                const HSpace(Insets.i8),
                                                Text("1",
                                                    style: appCss
                                                        .dmDenseMedium16
                                                        .textColor(
                                                            appColor(context)
                                                                .appTheme
                                                                .primary))
                                              ]),
                                          Text("Large Books",
                                                  style: appCss.dmDenseMedium12
                                                      .textColor(
                                                          appColor(context)
                                                              .appTheme
                                                              .lightText))
                                              .paddingOnly(left: 8)
                                        ])))
                          ]),
                      const VSpace(Insets.i25),
                      Text(appFonts.notes, style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      Center(
                          child: Container(
                              height: Sizes.s119,
                              decoration: BoxDecoration(
                                  color:
                                      appColor(context).appTheme.containerClr1,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: const Color(0xff541F5C)
                                          .withOpacity(0.2),
                                      width: 1)),
                              child: Stack(children: [
                                TextField(
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(15),
                                        hintText: 'Enter Text..',
                                        hintStyle: appCss.dmDenseRegular14
                                            .textColor(appColor(context)
                                                .appTheme
                                                .primary),
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 4),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 6, right: 6),
                                        alignment: Alignment.center,
                                        height: Sizes.s32,
                                        width: Sizes.s35,
                                        decoration: BoxDecoration(
                                            color: appColor(context)
                                                .appTheme
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: SvgPicture.asset(
                                            "assets/svg/tick.svg")))
                              ]))),
                      const VSpace(Insets.i25)
                    ]).paddingOnly(
                        top: MediaQuery.of(context).size.height / 10,
                        left: Insets.i20,
                        right: Insets.i20))
              ])));
    });
  }
}
