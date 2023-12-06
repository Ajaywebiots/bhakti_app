import 'package:bhakti_app/config.dart';


class ShareMySadhana extends StatelessWidget {
  const ShareMySadhana({super.key});

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
              const HSpace(Insets.i50),
              Text(appFonts.shareMyShadhana,
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
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(appFonts.userList,
                          style: appCss.philosopherBold18
                              .textColor(appColor(context).appTheme.oneText)),
                      Row(children: [
                        SvgPicture.asset(eSvgAssets.add),
                        TextButton(onPressed: () =>
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return const AddUserLayout();
                                })),
                            child: Text(appFonts.addUser,
                                style: appCss.dmDenseMedium14
                                    .textColor(
                                    appColor(context).appTheme.primary))
                        )
                      ])
                    ]),
                const VSpace(Insets.i15),
                Container(alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: appColor(context)
                                .appTheme
                                .primary
                                .withOpacity(0.20)),
                        borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                        decoration: InputDecoration(filled: true,
                            fillColor: const Color(0x0FC35DD2),
                            hintText: 'Search Here',
                            hintStyle: appCss.dmDenseRegular14.textColor(
                                appColor(context).appTheme.lightText),
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
                        children: appArray.shareMySadhanaList
                            .asMap()
                            .entries
                            .map((e) {
                          return Column(
                              children: [
                            SettingListLayouts(
                                image: e.value['image'],
                                index: e.key,
                                isShare: true,
                                widget: const CommonTrailingLayout(
                                    svg: "assets/svg/delete.svg").inkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const ShareMySadhanaDialog();
                                        });
                                  },),
                                list: appArray.shareMySadhanaList,
                                text: e.value['name'])
                          ]);
                        }).toList())
                        .paddingSymmetric(vertical: Insets.i10))
              ]).paddingSymmetric(horizontal: 20))
        ]));
  }
}
