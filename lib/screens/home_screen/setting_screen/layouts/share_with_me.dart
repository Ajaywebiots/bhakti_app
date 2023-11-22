import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/setting_list_layouts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../layouts/list_model.dart';

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
              Text("Sharing with me",
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
                  Text("User List",
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
                            prefixIcon: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/svg/search-normal.svg"),
                                const HSpace(Insets.i10),
                                SvgPicture.asset(eSvgAssets.line)
                              ],
                            ).paddingAll(10),
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
                        children: sharingWithMeList
                            .asMap()
                            .entries
                            .map((e) {
                          return Column(children: [
                            SettingListLayouts(
                                image: e.value['image'],
                                index: e.key,
                                isShare: true,
                                widget: PopupMenuButton(onSelected: (value) {
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
                                                                "Delete user",
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
                                                                "Are You Sure You Want to Delete This user? ",
                                                                style: appCss
                                                                    .dmDenseRegular14
                                                                    .textColor(
                                                                    appColor(
                                                                        context)
                                                                        .appTheme
                                                                        .rulesClr))),
                                                        Center(
                                                            child: Text(
                                                                style: appCss
                                                                    .dmDenseRegular14
                                                                    .textColor(
                                                                    appColor(
                                                                        context)
                                                                        .appTheme
                                                                        .rulesClr),
                                                                "This Action Can’t Be Undone.")),
                                                        const VSpace(
                                                            Insets.i25),
                                                        Row(mainAxisAlignment: MainAxisAlignment
                                                            .center,
                                                            children: [
                                                              Container(
                                                                  alignment: Alignment
                                                                      .center,
                                                                  decoration: BoxDecoration(
                                                                      border: Border
                                                                          .all(
                                                                          width: 1,
                                                                          color: appColor(
                                                                              context)
                                                                              .appTheme
                                                                              .primary),
                                                                      borderRadius: BorderRadius
                                                                          .circular(
                                                                          8)),
                                                                  height: 44,
                                                                  width: 120,
                                                                  child: Text(
                                                                      "Cancel",
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
                                                                  Insets.i15),
                                                              Container(
                                                                  alignment: Alignment
                                                                      .center,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius
                                                                          .circular(
                                                                          8),
                                                                      color: appColor(
                                                                          context)
                                                                          .appTheme
                                                                          .primary),
                                                                  height: 44,
                                                                  width: 120,
                                                                  child: Text(
                                                                      "Delete",
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
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                      "assets/svg/option.svg"),
                                  itemBuilder: (context) =>
                                  [
                                    PopupMenuItem(
                                        value: 1,
                                        child: Text('Check Sadhana',
                                            style: appCss.dmDenseRegular14
                                                .textColor(
                                                appColor(context).appTheme
                                                    .rulesClr))),
                                    PopupMenuItem(
                                        value: 2,
                                        child: Text('Delete User',
                                            style: appCss.dmDenseRegular14
                                                .textColor(
                                                appColor(context).appTheme
                                                    .rulesClr))),
                                  ],
                                ),
                                list: sharingWithMeList,
                                text: e.value['name'])
                          ]);
                        }).toList())
                        .paddingSymmetric(vertical: Insets.i10))
              ]).paddingSymmetric(horizontal: 20))
        ]));
  }
}
