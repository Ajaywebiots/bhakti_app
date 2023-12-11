import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/add_user_search_layout.dart';
import 'package:bhakti_app/widgets/common_app_bar.dart';
import 'package:bhakti_app/widgets/common_container_tile.dart';
import 'package:bhakti_app/widgets/common_left_side_text.dart';

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
            CommonContainerTile(
                paddingArea: const EdgeInsets.all(15),
                child: Column(
                    children: appArray.searchList.asMap().entries.map((e) {
                  return AddUserSearchLayout(dataInt: e.key, data: e.value);
                }).toList()))
          ]).paddingSymmetric(horizontal: 20))
        ]));
  }
}
