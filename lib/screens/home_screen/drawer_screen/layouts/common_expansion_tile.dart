import 'package:bhakti_app/config.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final String? svgIcon;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.svgIcon,
  });

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      return Column(children: [
        GestureDetector(
            onTap: () => homeScreenPvr.onExpandTileTap(),
            child: Row(children: [
              const HSpace(Insets.i10),
              SvgPicture.asset(homeScreenPvr.isExpanded
                  ? 'assets/svg/book-1.svg'
                  : widget.svgIcon!),
              const HSpace(Insets.i10),
              Text(widget.title,
                  style: appCss.dmDenseRegular16.textColor(
                      homeScreenPvr.isExpanded
                          ? appColor(context).appTheme.primary
                          : appColor(context).appTheme.lightText)),
              const HSpace(Insets.i100),
              SvgPicture.asset(
                homeScreenPvr.isExpanded
                    ? eSvgAssets.arrowUp
                    : eSvgAssets.arrowDown1,
                colorFilter: ColorFilter.mode(
                    homeScreenPvr.isExpanded
                        ? appColor(context).appTheme.primary
                        : appColor(context).appTheme.lightText,
                    BlendMode.srcIn),
              )
            ])
                .decorated(
                    gradient: LinearGradient(
                        colors: homeScreenPvr.isExpanded
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
                                appColor(context).appTheme.trans
                              ]))
                .height(50)),
        AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: homeScreenPvr.isExpanded ? null : 0,
            child: homeScreenPvr.isExpanded
                ? Column(children: widget.children)
                : Container())
      ]);
    });
  }
}
