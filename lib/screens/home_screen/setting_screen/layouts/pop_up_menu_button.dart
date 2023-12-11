import '../../../../config.dart';
import 'package:bhakti_app/utils/tool_tip_shape.dart';

class PopUpMenuButtonLayout extends StatelessWidget {
  final PopupMenuItemSelected? onSelected;
  const PopUpMenuButtonLayout({super.key, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        padding: EdgeInsets.zero,
        offset: const Offset(0, 50),
        onSelected: onSelected,
        elevation: 2,
        shape: TooltipShape(),
        child: SvgPicture.asset(eSvgAssets.option),
        itemBuilder: (context) => [
          PopupMenuItem(
              padding: const EdgeInsets.fromLTRB(
                  20, 0, 0, 0),
              value: 1,
              child: Text(appFonts.checkSadhana,
                  style: appCss.dmDenseRegular14
                      .textColor(appColor(context)
                      .appTheme
                      .rulesClr))),
          PopupMenuItem(
              height: 0,
              padding: EdgeInsets.zero,
              child: SvgPicture.asset(
                  eSvgAssets.lineRuler)),
          PopupMenuItem(
              padding: const EdgeInsets.fromLTRB(
                  20, 0, 0, 0),
              value: 2,
              child: Text(appFonts.deleteUser,
                  style: appCss.dmDenseRegular14
                      .textColor(appColor(context)
                      .appTheme
                      .rulesClr)))
        ]);
  }
}
