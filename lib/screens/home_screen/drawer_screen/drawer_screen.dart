import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/drawer_screen/layouts/drawer_list_tile_layout.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      return Drawer(
          child: Stack(alignment: Alignment.bottomCenter, children: [
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const VSpace(Insets.i40),
          Image.asset(eImageAssets.bhaktiLogo,
              height: Sizes.s30, width: Sizes.s136),
          const VSpace(Insets.i40),
          ...appArray.drawerList.asMap().entries.map((e) {
            List testingList = [];
            if (e.value['name'] == "Online Tests") {
              testingList = e.value['list'];
            }
            return DrawerListTileLayout(
                index: e.key,
                selectedIndex: homeScreenPvr.selectedIndex,
                drawerOnTap: () => homeScreenPvr.onTapDrawer(e.key),
                data: e.value,
                testingList: testingList);
          })
        ]),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(appFonts.version,
              style: appCss.dmDenseRegular14
                  .textColor(appColor(context).appTheme.lightText)),
          const VSpace(Insets.i8),
          SvgPicture.asset(eSvgAssets.profileLine, width: Sizes.s224),
          const VSpace(Insets.i19),
          Row(children: [
            const HSpace(Insets.i20),
            SvgPicture.asset(eSvgAssets.logOut),
            const HSpace(Insets.i10),
            Text(appFonts.logOut,
                style: appCss.dmDenseRegular16
                    .textColor(appColor(context).appTheme.lightText))
          ]).inkWell(onTap: () {
            homeScreenPvr.key.currentState!.closeDrawer();
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: SizedBox(
                          height: 175,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(appFonts.logOut,
                                        style: appCss.philosopherBold18
                                            .textColor(appColor(context)
                                                .appTheme
                                                .primary))),
                                const VSpace(Insets.i10),
                                Center(
                                    child: Text(
                                        appFonts.areYouSureYouWantToLogOut,
                                        style: appCss.dmDenseRegular14
                                            .textColor(appColor(context)
                                                .appTheme
                                                .rulesClr))),
                                const VSpace(Insets.i25),
                                CommonSelectionButton(textOne: appFonts.no,
                                    textTwo: appFonts.yes,
                                    onTapOne: () => Navigator.pop(context),
                                    onTapTwo: () =>
                                        homeScreenPvr.onSignOutClick(context))
                              ])));
                });
          })
        ]).paddingSymmetric(vertical: 50)
      ]));
    });
  }
}
