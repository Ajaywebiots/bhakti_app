import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/setting_list_layouts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SharingWithMe extends StatelessWidget {
  const SharingWithMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
            leading: Container(),
            backgroundColor: Colors.transparent,
            titleSpacing: 0,
            leadingWidth: 0,
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const HSpace(Insets.i20),
              SvgPicture.asset("assets/svg/arrowLeft.svg").inkWell(
                onTap: () => Navigator.pop(context),
              ),
              const HSpace(Insets.i70),
              Text(appFonts.sharingWithMe,
                  style: appCss.philosopherBold28
                      .textColor(appColor(context).appTheme.oneText))
            ])),
        body: Stack(alignment: Alignment.topLeft, children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(eImageAssets.splashBg)))),
          SingleChildScrollView(
              child:
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const VSpace(Insets.i120),
                Row(children: [
                  Text(appFonts.userList,
                      style: appCss.philosopherBold18
                          .textColor(appColor(context).appTheme.oneText))
                ]),
                const VSpace(Insets.i15),
                Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0x0FC35DD2),
                        border: Border.all(
                            color: appColor(context)
                                .appTheme
                                .primary
                                .withOpacity(0.20)),
                        borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search Here',
                            prefixIcon: Row(children: [
                              SvgPicture.asset("assets/svg/search-normal.svg"),
                              const HSpace(Insets.i10),
                              SvgPicture.asset(eSvgAssets.line)
                            ]).paddingAll(10),
                            disabledBorder: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(AppRadius.r8)),
                                borderSide: BorderSide.none),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(AppRadius.r8)),
                                borderSide: BorderSide.none),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(AppRadius.r8)),
                                borderSide: BorderSide.none),
                            border: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(AppRadius.r8)),
                                borderSide: BorderSide.none)),
                        onSubmitted: (String value) {
                          debugPrint(value);
                        })),
                const VSpace(Insets.i15),
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
                          children: appArray.sharingWithMeList
                              .asMap()
                              .entries
                              .map((e) {
                            return Column(children: [
                              SettingListLayouts(
                                  image: e.value['image'],
                                  index: e.key,
                                  isShare: true,
                                  widget: PopupMenuButton(
                                      padding: EdgeInsets.zero,
                                      offset: const Offset(0, 50),
                                      onSelected: (value) {
                                        if (value == 1) {
                                          Navigator.pop(context);
                                          // if value 2 show dialog
                                        } else if (value == 2) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(8)),
                                                    child: SizedBox(
                                                        height: 175,
                                                        child: Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              const VSpace(
                                                                  Insets.i10),
                                                              Center(
                                                                  child: Text(
                                                                      appFonts
                                                                          .deleteUser,
                                                                      style: appCss
                                                                          .philosopherBold18
                                                                          .textColor(
                                                                          appColor(
                                                                              context)
                                                                              .appTheme
                                                                              .primary))),
                                                              const VSpace(
                                                                  Insets.i10),
                                                              Center(
                                                                  child: Text(
                                                                      appFonts
                                                                          .areYouSure,
                                                                      style: appCss
                                                                          .dmDenseRegular14
                                                                          .textColor(
                                                                          appColor(
                                                                              context)
                                                                              .appTheme
                                                                              .rulesClr))),
                                                              Center(
                                                                  child: Text(
                                                                    appFonts
                                                                        .thisAction,
                                                                    style: appCss
                                                                        .dmDenseRegular14
                                                                        .textColor(
                                                                        appColor(
                                                                            context)
                                                                            .appTheme
                                                                            .rulesClr),
                                                                  )),
                                                              const VSpace(
                                                                  Insets.i25),
                                                              Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                                  children: [
                                                                    Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .center,
                                                                        decoration: BoxDecoration(
                                                                            border: Border
                                                                                .all(
                                                                                width:
                                                                                1,
                                                                                color: appColor(
                                                                                    context)
                                                                                    .appTheme
                                                                                    .primary),
                                                                            borderRadius:
                                                                            BorderRadius
                                                                                .circular(
                                                                                8)),
                                                                        height: 44,
                                                                        width: 120,
                                                                        child: Text(
                                                                            appFonts
                                                                                .cancel,
                                                                            style: appCss
                                                                                .dmDenseMedium16
                                                                                .textColor(
                                                                                appColor(
                                                                                    context)
                                                                                    .appTheme
                                                                                    .primary)))
                                                                        .inkWell(
                                                                        onTap: () {
                                                                          Navigator
                                                                              .pop(
                                                                              context);
                                                                        }),
                                                                    const HSpace(
                                                                        Insets
                                                                            .i15),
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
                                                                            appFonts
                                                                                .delete,
                                                                            style: appCss
                                                                                .dmDenseMedium16
                                                                                .textColor(
                                                                                appColor(
                                                                                    context)
                                                                                    .appTheme
                                                                                    .whiteColor)))
                                                                        .inkWell(
                                                                        onTap: () {
                                                                          Navigator
                                                                              .pop(
                                                                              context);
                                                                        })
                                                                  ])
                                                            ])));
                                              });
                                        }
                                      },
                                      elevation: 2,
                                      shape: TooltipShape(),
                                      child: SvgPicture.asset(
                                          "assets/svg/option.svg"),
                                      itemBuilder: (context) =>
                                      [
                                        PopupMenuItem(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 0, 0),
                                            value: 1,
                                            child: Text(appFonts.checkSadhana,
                                                style: appCss.dmDenseRegular14
                                                    .textColor(
                                                    appColor(context).appTheme
                                                        .rulesClr))),
                                        PopupMenuItem(
                                            height: 0, padding: EdgeInsets.zero,
                                            child: SvgPicture.asset(
                                                eSvgAssets.lineRuler)),

                                        PopupMenuItem(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 0, 0),
                                            value: 2,
                                            child: Text(appFonts.deleteUser,
                                                style: appCss.dmDenseRegular14
                                                    .textColor(
                                                    appColor(context).appTheme
                                                        .rulesClr)))
                                      ]
                                  ),
                                  list: appArray.sharingWithMeList,
                                  text: e.value['name'])
                            ]);
                          }).toList())
                        .paddingSymmetric(vertical: Insets.i10))
              ]).paddingSymmetric(horizontal: 20))
        ]));
  }
}


class TooltipShape extends ShapeBorder {
  TooltipShape();

  final BorderSide _side = const BorderSide(color: Color(0xff541F5C), width: 1);
  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(_side.width);

  @override
  Path getInnerPath(Rect rect, {
    TextDirection? textDirection,
  }) {
    final Path path = Path();

    path.addRRect(
      _borderRadius.resolve(textDirection).toRRect(rect).deflate(_side.width),
    );

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();
    final RRect rrect = _borderRadius.resolve(textDirection).toRRect(rect);

    path.moveTo(0, 10);
    path.quadraticBezierTo(0, 0, 10, 0);
    path.lineTo(rrect.width - 30, 0);
    path.lineTo(rrect.width - 20, -10);
    path.lineTo(rrect.width - 10, 0);
    path.quadraticBezierTo(rrect.width, 0, rrect.width, 10);
    path.lineTo(rrect.width, rrect.height - 10);
    path.quadraticBezierTo(
        rrect.width, rrect.height, rrect.width - 10, rrect.height);
    path.lineTo(10, rrect.height);
    path.quadraticBezierTo(0, rrect.height, 0, rrect.height - 10);

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) =>
      RoundedRectangleBorder(
        side: _side.scale(t),
        borderRadius: _borderRadius * t,
      );
}