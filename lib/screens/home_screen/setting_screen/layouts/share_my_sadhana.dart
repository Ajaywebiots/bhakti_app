import 'package:bhakti_app/config.dart';

class ShareMySadhana extends StatelessWidget {
  const ShareMySadhana({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(builder: (context, settingPvr, child) {
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  CommonAppBar(
                      onTap: () => Navigator.pop(context),
                      text: appFonts.shareMyShadhana,
                      hSpace: Insets.i50),
                  const VSpace(Insets.i25),
                  CommonLeftSideText(
                      text: appFonts.userList,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const AddUserLayout();
                        }));
                      },
                      isRightText: true,
                      rightText: appFonts.addUser),
                  const VSpace(Insets.i15),
                      CommonTextField(
                          prefixIcon: Row(children: [
                            SvgPicture.asset(eSvgAssets.searchNormal)
                                .paddingOnly(right: 10, left: 10),
                            SvgPicture.asset(eSvgAssets.line).paddingOnly(right: 10)
                          ]),
                          height: 50,
                          controller: settingPvr.searchBookHere,
                          hintText: appFonts.searchHere),
                  const VSpace(Insets.i15),
                  CommonContainerTile(
                      paddingArea: const EdgeInsets.all(15),
                      child: Column(
                              children: appArray.shareMySadhanaList
                                  .asMap()
                                  .entries
                                  .map((e) {
                        return Column(children: [
                          SettingListLayouts(
                              image: e.value['image'],
                              index: e.key,
                              isShare: true,
                              widget:
                                  CommonTrailingLayout(svg: eSvgAssets.delete)
                                      .inkWell(onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const ShareMySadhanaDialog();
                                    });
                              }),
                              list: appArray.shareMySadhanaList,
                              text: e.value['name'])
                        ]);
                      }).toList())
                          .paddingSymmetric(vertical: Insets.i10))
                ]).paddingSymmetric(horizontal: 20))
          ]));
    });
  }
}
