import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/home_screen_provider.dart';
import 'package:bhakti_app/screens/home_screen/drawer_screen/layouts/my_documents_screen.dart';
import 'package:bhakti_app/screens/home_screen/layouts/list_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          Image.asset(eImageAssets.bhaktiLogo, height: 30, width: 136),
          ...drawerList.asMap().entries.map((e) {
            List testingList = [];
            if (e.value['name'] == "Online Tests") {
              testingList = e.value['list'];
            }
            return ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyDocumentScreen();
                  },));
                },
                title: e.value['name'] == "Online Tests"
                    ? ExpansionTile(
                        trailing: SvgPicture.asset(
                            homeScreenPvr.onChange == false
                                ? eSvgAssets.arrowDown1
                                : eSvgAssets.arrowUp),
                        onExpansionChanged: (value) {
                          setState(() {
                            homeScreenPvr.onChange = !homeScreenPvr.onChange;
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
                                leading: SvgPicture.asset(s.value['icon']),
                                title: Text(s.value['name'],
                                    style: appCss.dmDenseRegular16.textColor(
                                        appColor(context).appTheme.lightText))))
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
          ]).inkWell(onTap: () => homeScreenPvr.onSignOutClick(context))
        ]).paddingSymmetric(vertical: 50)
      ]));
    });
  }
}
