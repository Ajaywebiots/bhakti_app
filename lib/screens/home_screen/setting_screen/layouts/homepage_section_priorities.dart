import 'package:bhakti_app/config.dart';
import 'home_page_reorder_layout.dart';

class HomePageSection extends StatelessWidget {
  const HomePageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(builder: (context, settingPvr, child) {
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
                SvgPicture.asset(eSvgAssets.arrowLeft)
                    .inkWell(onTap: () => Navigator.pop(context)),
                const HSpace(Insets.i40),
                Text(appFonts.homePageSection,
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
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  VSpace(Insets.i120),
                  Column(children: [
                    SizedBox(height: 580, child: HomePageReorderLayout())
                  ])
                ]).paddingSymmetric(horizontal: 20))
          ]));
    });
  }
}
