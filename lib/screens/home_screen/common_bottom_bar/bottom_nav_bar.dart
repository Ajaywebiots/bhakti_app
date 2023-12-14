import '../../../config.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (context, bottomNavPvr, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 50),
              () => bottomNavPvr.onInit(this)),
          child: TabBar(
              onTap: (val) => bottomNavPvr.onTapTab(val),
              controller: bottomNavPvr.tabController,
              tabs: bottomNavPvr.dashList
                  .asMap()
                  .entries
                  .map((e) => Tab(
                      text: e.value["title"].toString(),
                      icon: SvgPicture.asset(
                          bottomNavPvr.tabController?.index == e.key
                              ? e.value["icon2"]
                              : e.value["icon"])))
                  .toList(),
              indicatorWeight: 3,
              indicatorPadding:
                  const EdgeInsets.symmetric(horizontal: Insets.i35),
              labelStyle: appCss.dmDenseMedium12
                  .textColor(appColor(context).appTheme.whiteColor),
              labelColor: appColor(context).appTheme.whiteColor,
              unselectedLabelStyle: appCss.dmDenseMedium12
                  .textColor(appColor(context).appTheme.whiteColor),
              unselectedLabelColor: appColor(context).appTheme.bottomText,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: appColor(context).appTheme.whiteColor));
    });
  }
}
