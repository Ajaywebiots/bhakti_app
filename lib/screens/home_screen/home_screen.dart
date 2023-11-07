import 'layouts/notes_layout.dart';
import 'layouts/regulation_layout.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/auth_screen/login_auth_screen/login_auth_screen.dart';
import 'package:bhakti_app/screens/home_screen/layouts/list_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/widgets/common_app_bar.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/screens/home_screen/layouts/book_layout.dart';
import 'package:bhakti_app/screens/home_screen/layouts/sleep_layout.dart';
import 'package:bhakti_app/screens/home_screen/layouts/week_calendar.dart';
import 'package:bhakti_app/screens/home_screen/layouts/wok_ship_layout.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_bottom_bar.dart';
import 'package:bhakti_app/screens/home_screen/layouts/association_layout.dart';
import 'package:bhakti_app/screens/home_screen/layouts/chanting_common_layout.dart';
import 'package:bhakti_app/screens/home_screen/layouts/book_distribution_layout.dart';
import 'package:bhakti_app/providers/home_screen_provider/home_screen_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool onLastPage = false;
  bool onChange = false;
  bool onLength = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context1, homeScreenPvr, child) {
      return SafeArea(
          child: Scaffold(
              drawer: Drawer(
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const VSpace(Insets.i40),
                  Image.asset(eImageAssets.bhaktiLogo, height: 30, width: 136),
                  ...drawerList.asMap().entries.map((e) {
                    List testingList = [];
                    if (e.value['name'] == "Online Tests") {
                      testingList = e.value['list'];
                    }
                    return ListTile(
                        title: e.value['name'] == "Online Tests"
                            ? ExpansionTile(
                                trailing: SvgPicture.asset(onChange == false
                                    ? eSvgAssets.arrowDown1
                                    : eSvgAssets.arrowUp),
                                onExpansionChanged: (value) {
                                  setState(() {
                                    onChange = !onChange;
                                  });
                                },
                                tilePadding: EdgeInsets.zero,
                                title: Row(children: [
                                  SvgPicture.asset(e.value['icon']),
                                  const HSpace(Insets.i10),
                                  Text("Online Tests",
                                      style: appCss.dmDenseRegular16.textColor(
                                          appColor(context).appTheme.lightText))
                                ]),
                                children: testingList
                                    .asMap()
                                    .entries
                                    .map((s) => ListTile(
                                        leading:
                                            SvgPicture.asset(s.value['icon']),
                                        title: Text(s.value['name'],
                                            style: appCss.dmDenseRegular16
                                                .textColor(appColor(context)
                                                    .appTheme
                                                    .lightText))))
                                    .toList())
                            : Row(children: [
                                SvgPicture.asset(e.value['icon']),
                                const HSpace(Insets.i10),
                                Text(e.value['name'],
                                    style: appCss.dmDenseRegular16.textColor(
                                        appColor(context).appTheme.lightText))
                              ]));
                  }).toList(),
                  const VSpace(Insets.i83),
                  const VSpace(Insets.i49)
                ]),
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Version 1.0",
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).appTheme.lightText)),
                  const VSpace(Insets.i8),
                  SvgPicture.asset("assets/svg/versionLine.svg"),
                  const VSpace(Insets.i19),
                  Row(children: [
                    const HSpace(Insets.i20),
                    SvgPicture.asset("assets/svg/logOut.svg"),
                    const HSpace(Insets.i10),
                    Text("Log Out",
                        style: appCss.dmDenseRegular16
                            .textColor(appColor(context).appTheme.lightText))
                  ]).inkWell(onTap: () async {
                    await FirebaseAuth.instance.signOut().then((value) {
                      homeScreenPvr.clearSharedPreferences();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginAuthScreen();
                      }));
                    });
                  })
                ]).paddingSymmetric(vertical: 50)
              ])),
              extendBody: true,
              bottomNavigationBar: const CommonBottomBar(),
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
                      const CommonAppBar(),
                      const VSpace(Insets.i23),
                      const WeekCalendar(),
                      const VSpace(Insets.i15),
                      Text(appFonts.sleep, style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      const SleepLayout(),
                      const VSpace(Insets.i25),
                      Text(appFonts.worship, style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      const WorshipLayout(),
                      const VSpace(Insets.i25),
                      Text(appFonts.chanting, style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      const Stack(alignment: Alignment.centerRight, children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: ChantingCommon()),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: appColor(context).appTheme.whiteColor,
                        //       borderRadius: BorderRadius.circular(8),
                        //       boxShadow: [
                        //         BoxShadow(
                        //             color: appColor(context).appTheme.shadowClr,
                        //             blurRadius: 3,
                        //             offset: const Offset(2, 2),
                        //             spreadRadius: 2)
                        //       ]),
                        //   height: Sizes.s75,
                        //   width: Sizes.s25,
                        //   child: Icon(
                        //       onLength == false
                        //           ? Icons.keyboard_arrow_right
                        //           : Icons.keyboard_arrow_left,
                        //       color: appColor(context).appTheme.primary),
                        // ).inkWell(onTap: () {
                        //   if (chantingList.length > 3) {
                        //     if (onLength) {
                        //       homeScreenPvr.itemScrollController
                        //           .jumpTo(index: 0);
                        //     } else {
                        //       homeScreenPvr.itemScrollController
                        //           .jumpTo(index: chantingList.length);
                        //     }
                        //     setState(() {
                        //       onLength = !onLength;
                        //     });
                        //   }
                        // })
                      ]).width(double.infinity),
                      const VSpace(Insets.i15),
                      Text(appFonts.regulations,
                          style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      const RegulationLayout(),
                      const VSpace(Insets.i25),
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
                      const VSpace(Insets.i15),
                      Stack(children: [
                        const BookLayout(),
                        Positioned(
                            top: 60,
                            right: 0,
                            child: Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 5)
                                        ],
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: const Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.black))
                                .inkWell(onTap: () {
                              if (bookList.length > 3) {
                                homeScreenPvr.itemScrollController1
                                    .jumpTo(index: bookList.length);
                              }
                            })),
                        Positioned(
                            top: 60,
                            left: 0,
                            child: Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 5)
                                        ],
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: const Icon(Icons.keyboard_arrow_left,
                                        color: Colors.black))
                                .inkWell(onTap: () {
                              /*omeScreenPvr.itemScrollController1
                                  .jumpTo(index: 0);*/
                            }))
                      ]),
                      const VSpace(Insets.i25),
                      Text(appFonts.association,
                          style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      const AssociationLayout(),
                      const VSpace(Insets.i25),
                      Text(appFonts.bookDistribution,
                          style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      const BookDistributionLayout(),
                      const VSpace(Insets.i25),
                      Text(appFonts.notes, style: appCss.philosopherBold18),
                      const VSpace(Insets.i15),
                      const NotesLayout()
                    ]).paddingOnly(
                        top: MediaQuery.of(context).size.height * 0.01,
                        bottom: MediaQuery.of(context).size.height * 0.15,
                        left: Insets.i20,
                        right: Insets.i20))
              ])));
    });
  }
}
