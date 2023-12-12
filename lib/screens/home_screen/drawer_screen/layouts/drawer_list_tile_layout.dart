import '../../../../config.dart';
import 'package:bhakti_app/screens/home_screen/drawer_screen/layouts/my_documents_screen.dart';

class DrawerListTileLayout extends StatelessWidget {
  final dynamic data;
  final List? testingList;

  const DrawerListTileLayout({super.key, this.data, this.testingList});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      return ListTile(
              dense: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyDocumentScreen();
                }));
              },
              title: data['name'] == "Online Tests"
                  ? ListTileTheme(
                      data: const ListTileThemeData(
                          minVerticalPadding: 0,
                          contentPadding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          horizontalTitleGap: 0.0,
                          minLeadingWidth: 0,
                          dense: true),
                      child: ExpansionTile(
                          trailing: SvgPicture.asset(
                              homeScreenPvr.onChange == false
                                  ? eSvgAssets.arrowDown1
                                  : eSvgAssets.arrowUp),
                          onExpansionChanged: (value) =>
                              homeScreenPvr.onExpansionChanged(),
                          tilePadding: EdgeInsets.zero,
                          title: Row(children: [
                            SvgPicture.asset(data['icon']),
                            const HSpace(Insets.i10),
                            Text(appFonts.onlineTest,
                                style: appCss.dmDenseRegular16.textColor(
                                    appColor(context).appTheme.lightText))
                          ]),
                          children: testingList!
                              .asMap()
                              .entries
                              .map((s) => ListTile(
                                  dense: true,
                                  leading: SvgPicture.asset(s.value['icon']),
                                  title: Text(s.value['name'],
                                      style: appCss.dmDenseRegular16.textColor(
                                          appColor(context)
                                              .appTheme
                                              .lightText))))
                              .toList()),
                    )
                  : Row(children: [
                      SvgPicture.asset(data['icon']),
                      const HSpace(Insets.i10),
                      Text(data['name'],
                          style: appCss.dmDenseRegular16
                              .textColor(appColor(context).appTheme.lightText))
                    ]))
          .decorated(
              color:
                  data['name'] == "Online Tests" ? Colors.green : Colors.black);
    });
  }
}
