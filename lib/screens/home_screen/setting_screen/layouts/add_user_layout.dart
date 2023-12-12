import 'package:bhakti_app/config.dart';

class AddUserLayout extends StatelessWidget {
  const AddUserLayout({super.key});

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
                      text: appFonts.search,
                      onTap: () => Navigator.pop(context),
                      hSpace: Insets.i120),
                  CommonLeftSideText(
                      isRightText: true,
                      onTap: () {},
                      text: appFonts.userList,
                      rightText: appFonts.addUser),
                  const VSpace(Insets.i15),
                  CommonTextField(
                      hintText: appFonts.searchHere,
                      prefixSvg: eSvgAssets.searchNormal,
                      controller: settingPvr.searchUser),
                  const VSpace(Insets.i15),
                  CommonContainerTile(
                      paddingArea: const EdgeInsets.all(15),
                      child: Column(
                          children:
                              appArray.searchList.asMap().entries.map((e) {
                        return AddUserSearchLayout(
                            dataInt: e.key, data: e.value);
                      }).toList()))
                ]).paddingSymmetric(horizontal: 20))
          ]));
    });
  }
}
