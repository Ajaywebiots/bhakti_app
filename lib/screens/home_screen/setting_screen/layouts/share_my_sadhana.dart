import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/common_app_bar.dart';
import 'package:bhakti_app/widgets/common_container_tile.dart';
import 'package:bhakti_app/widgets/common_left_side_text.dart';
import 'package:bhakti_app/widgets/common_textfield.dart';

class ShareMySadhana extends StatelessWidget {
  const ShareMySadhana({super.key});

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
                onTap: () => Navigator.pop(context),
                text: appFonts.shareMyShadhana,
                hSpace: Insets.i50),
            const VSpace(Insets.i25),
            CommonLeftSideText(
                text: appFonts.userList,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                    return const AddUserLayout();
                  }));
                },
                isRightText: true,
                rightText: appFonts.addUser),
            const VSpace(Insets.i15),
            CommonTextField(
                hintText: 'Search Here',
                prefixSvg: eSvgAssets.searchNormal,
                prefixSvg1: eSvgAssets.line),
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
                        widget: CommonTrailingLayout(svg: eSvgAssets.delete)
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
  }
}
