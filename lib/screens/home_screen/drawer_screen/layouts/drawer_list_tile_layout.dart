import '../../../../config.dart';
import 'common_expansion_tile.dart';

class DrawerListTileLayout extends StatelessWidget {
  final dynamic data;
  final List? testingList;
  final GestureTapCallback? drawerOnTap;
  final int? index, selectedIndex;

  const DrawerListTileLayout(
      {super.key,
      this.data,
      this.testingList,
      this.drawerOnTap,
      this.index,
      this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      return ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              onTap: () => homeScreenPvr.onListNavigate(),
              title: data['name'] == "Online Tests"
                  ? CustomExpansionTile(
                      svgIcon: data['icon'],
                      title: 'Online Tests',
                      children: testingList!
                          .asMap()
                          .entries
                          .map((s) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              onTap: () {
                                homeScreenPvr.drawerExpansionList(s.key);
                              },
                              title: Row(children: [
                                const HSpace(Insets.i30),
                                SvgPicture.asset(s.value['icon']),
                                const HSpace(Insets.i10),
                                Text(s.value['name'],
                                    style: appCss.dmDenseRegular16.textColor(
                                        appColor(context).appTheme.lightText))
                              ])))
                          .toList())
                  : Row(children: [
                      const HSpace(Insets.i10),
                      SvgPicture.asset(homeScreenPvr.isExpanded
                          ? data['icon']
                          : selectedIndex == index
                              ? data['fillIcon']
                              : data['icon']),
                      const HSpace(Insets.i10),
                      Text(data['name'],
                          style: appCss.dmDenseRegular16
                              .textColor(homeScreenPvr.isExpanded
                                  ? appColor(context).appTheme.lightText
                                  : selectedIndex == index
                                      ? appColor(context).appTheme.primary
                                      : appColor(context).appTheme.lightText))
                    ]).inkWell(onTap: drawerOnTap))
          .decorated(
              gradient: LinearGradient(
                  colors: homeScreenPvr.isExpanded
                      ? [
                          appColor(context).appTheme.trans,
                          appColor(context).appTheme.trans,
                        ]
                      : selectedIndex == index
                          ? [
                              appColor(context)
                                  .appTheme
                                  .primary
                                  .withOpacity(0.3),
                              appColor(context)
                                  .appTheme
                                  .primary
                                  .withOpacity(0.05)
                            ]
                          : [
                              appColor(context).appTheme.trans,
                              appColor(context).appTheme.trans,
                            ]));
    });
  }
}
