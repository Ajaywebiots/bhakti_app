import 'package:bhakti_app/config.dart';

class SharingWithMe extends StatelessWidget {
  const SharingWithMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(builder: (context, settingPvr, child) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: CommonBgImage(
              widget: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                CommonAppBar(
                    onTap: () => Navigator.pop(context),
                    hSpace: Insets.i70,
                    text: appFonts.sharingWithMe),
                const VSpace(Insets.i25),
                CommonLeftSideText(text: appFonts.userList),
                const VSpace(Insets.i15),
                CommonTextField(
                    hintText: appFonts.searchHere,
                    prefixSvg: eSvgAssets.searchNormal),
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
                            widget: PopUpMenuButtonLayout(
                                onSelected: (value) =>
                                    settingPvr.onSelected(context, value)),
                            list: appArray.sharingWithMeList,
                            text: e.value['name'])
                      ]);
                    }).toList())
                        .paddingSymmetric(vertical: Insets.i10))
              ]).paddingSymmetric(horizontal: 20))));
    });
  }
}
