import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_regulation.dart';

class NotificationLayouts extends StatelessWidget {
  const NotificationLayouts({super.key});

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
              SvgPicture.asset(eSvgAssets.arrowLeft)
                  .inkWell(onTap: () => Navigator.pop(context)),
              const HSpace(Insets.i90),
              Text(appFonts.notification,
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
            const VSpace(Insets.i100),
            Row(children: [
              Text("Notification Setting",
                  style: appCss.dmDenseExtraBold18
                      .textColor(appColor(context).appTheme.rulesClr))
            ]),
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
                    children: appArray.notificationSettingList
                        .asMap()
                        .entries
                        .map((e) {
                  return Column(children: [
                    CommonRegulation(
                        list: appArray.notificationSettingList,
                        index: e.key,
                        status: e.value['isOn'],
                        text: e.value['name'],
                        onToggle: (val) {
                          e.value['isOn'] = val;
                        })
                  ]);
                }).toList()))
          ]).paddingSymmetric(horizontal: 20))
        ]));
  }
}
