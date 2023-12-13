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
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Row(children: [
            SvgPicture.asset(widget.svgIcon!),
            const HSpace(Insets.i10),
            Text(widget.title,
                style: appCss.dmDenseRegular16
                    .textColor(appColor(context).appTheme.lightText)),
            const HSpace(Insets.i100),
            SvgPicture.asset(
                _isExpanded ? eSvgAssets.arrowUp : eSvgAssets.arrowDown1)
          ])),
      AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _isExpanded ? null : 0,
          child: _isExpanded ? Column(children: widget.children) : Container())
    ]);
  }
}
