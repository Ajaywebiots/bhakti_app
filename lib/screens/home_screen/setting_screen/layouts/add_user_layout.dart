import 'package:bhakti_app/config.dart';

class AddUserLayout extends StatelessWidget {
  const AddUserLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Stack(alignment: Alignment.topLeft, children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(eImageAssets.splashBg)))),
          SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            AppBar(
                leading: Container(),
                backgroundColor: Colors.transparent,
                titleSpacing: 0,
                leadingWidth: 0,
                title: Row(children: [
                  SvgPicture.asset(eSvgAssets.arrowLeft)
                      .inkWell(onTap: () => Navigator.pop(context)),
                  const HSpace(Insets.i120),
                  Text("Search",
                      style: appCss.philosopherBold28
                          .textColor(appColor(context).appTheme.oneText))
                ])),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(appFonts.userList,
                  style: appCss.philosopherBold18
                      .textColor(appColor(context).appTheme.oneText)),
              Row(children: [
                SvgPicture.asset(eSvgAssets.add),
                Text(appFonts.addUser,
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).appTheme.primary))
              ])
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
                        hintStyle: appCss.dmDenseMedium12,
                        prefixIcon: Row(children: [
                          SvgPicture.asset(eSvgAssets.searchNormal),
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
                    children: appArray.searchList.asMap().entries.map((e) {
                  return Column(children: [
                    SettingListLayouts(
                        image: e.value['image'],
                        index: e.key,
                        isShare: true,
                        widget: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          appColor(context).appTheme.shadowClr,
                                      blurRadius: 16,
                                      offset: const Offset(0, 4),
                                      spreadRadius: 0)
                                ],
                                color: appColor(context).appTheme.whiteColor),
                            width: 34,
                            height: 35,
                            child: SvgPicture.asset(eSvgAssets.add)),
                        list: appArray.searchList,
                        text: e.value['name'])
                  ]);
                }).toList()))
          ]).paddingSymmetric(horizontal: 20))
        ]));
  }
}
