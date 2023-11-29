import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/bottom_nav_provider.dart';
import 'package:bhakti_app/providers/home_screen_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/assets/index.dart';

class MyDocumentScreen extends StatefulWidget {
  const MyDocumentScreen({super.key});

  @override
  State<MyDocumentScreen> createState() => _MyDocumentScreenState();
}

class _MyDocumentScreenState extends State<MyDocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      final dashPvr = Provider.of<BottomNavProvider>(context, listen: true);
      return Scaffold(
          body: Stack(alignment: Alignment.topCenter, children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(eImageAssets.splashBg)))),
        SingleChildScrollView(
            child: Column(children: [
          AppBar(
              leading: Container(),
              backgroundColor: Colors.transparent,
              titleSpacing: 0,
              leadingWidth: 0,
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SvgPicture.asset("assets/svg/arrowLeft.svg").inkWell(onTap: () {
                  dashPvr.tabController!.index = 0;
                  homeScreenPvr.notifyListeners();
                }),
                const HSpace(Insets.i80),
                Text("My Document",
                    style: appCss.philosopherBold28
                        .textColor(appColor(context).appTheme.oneText))
              ])),
          const VSpace(Insets.i25),
          DottedBorder(
              color: appColor(context).appTheme.primary,
              child: Container(
                  height: 132,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Insets.i8),
                      color: appColor(context).appTheme.whiteColor)))
        ]).paddingSymmetric(horizontal: Insets.i20))
      ]));
    });
  }
}
