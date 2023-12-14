import 'dart:developer';

import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/setting_screen/layouts/setting_layout.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
        builder: (context, settingPvr, child) {
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
                      text: appFonts.setting,
                      onTap: () => settingPvr.tabControl(context),
                      hSpace: Insets.i100),
                  const VSpace(Insets.i25),
                  CommonContainerTile(
                      child: Column(
                              children:
                                  appArray.settingList.asMap().entries.map((e) {
                    return SettingLayout(dataInt: e.key, data: e.value);
                  }).toList())
                          .paddingSymmetric(vertical: Insets.i10))
                ]).paddingSymmetric(horizontal: 20))
          ]));
    });
  }
}
