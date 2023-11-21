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
                            SvgPicture.asset("assets/svg/search-normal.svg"),
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
                        children: sharingWithMeList.asMap().entries.map((e) {
                  return Column(children: [
                    SettingListLayouts(
                        image: e.value['image'],
                        index: e.key,
                        isShare: true,
                        widget: SvgPicture.asset("assets/svg/option.svg"),
                        list: sharingWithMeList,
                        text: e.value['name'])
                  ]);
                }).toList())
                    .paddingSymmetric(vertical: Insets.i10))
          ]).paddingSymmetric(horizontal: 20))
        ]));
  }
}
