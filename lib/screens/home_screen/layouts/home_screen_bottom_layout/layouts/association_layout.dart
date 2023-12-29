import 'package:bhakti_app/config.dart';

class AssociationLayout extends StatelessWidget {
  const AssociationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenPvr, child) {
      return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Stack(children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: appColor(context).appTheme.shadowClr,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                            spreadRadius: 0)
                      ],
                      color: appColor(context).appTheme.whiteColor),
                  height: Sizes.s68,
                  width: Sizes.s146,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(eSvgAssets.hearing),
                              const HSpace(Insets.i8),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        homeScreenPvr.sadhanaHearing.toString(),
                                        style: appCss.dmDenseMedium16.textColor(
                                            appColor(context)
                                                .appTheme
                                                .primary)),
                                    Text("Hear Sp",
                                        style: appCss.dmDenseMedium14.textColor(
                                            appColor(context)
                                                .appTheme
                                                .rulesClr))
                                  ])
                            ]).paddingOnly(left: 10, top: 4)
                      ])),
              const Positioned(
                  right: 14,
                  top: 7,
                  child: CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
              const Positioned(
                  left: 60,
                  top: 16.75,
                  child:
                      CommonCircleDesign(height: Sizes.s10, width: Sizes.s10)),
              const Positioned(
                  left: 100,
                  top: 52,
                  child:
                      CommonCircleDesign(height: Sizes.s10, width: Sizes.s10))
            ]).inkWell(onTap: () => homeScreenPvr.onHearingSelect(context)),
            const HSpace(Insets.i15),
            Stack(children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: appColor(context).appTheme.shadowClr,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                            spreadRadius: 0)
                      ],
                      color: appColor(context).appTheme.whiteColor),
                  height: Sizes.s68,
                  width: Sizes.s146,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(eSvgAssets.hearing),
                              const HSpace(Insets.i8),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(homeScreenPvr.hearingGuru.toString(),
                                        style: appCss.dmDenseMedium16.textColor(
                                            appColor(context)
                                                .appTheme
                                                .primary)),
                                    Text('Hear Guru',
                                        style: appCss.dmDenseMedium14.textColor(
                                            appColor(context)
                                                .appTheme
                                                .rulesClr))
                                  ])
                            ]).paddingOnly(left: 10, top: 4)
                      ])),
              const Positioned(
                  left: 64,
                  top: 7,
                  child: CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
              const Positioned(
                  left: 60,
                  top: 16.75,
                  child:
                      CommonCircleDesign(height: Sizes.s10, width: Sizes.s10)),
              const Positioned(
                  left: 100,
                  top: 52,
                  child:
                      CommonCircleDesign(height: Sizes.s10, width: Sizes.s10))
            ]).inkWell(onTap: () => homeScreenPvr.onChantSelect(context)),
            const HSpace(Insets.i15),
            Stack(children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: appColor(context).appTheme.shadowClr,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                            spreadRadius: 0)
                      ],
                      color: appColor(context).appTheme.whiteColor),
                  height: Sizes.s68,
                  width: Sizes.s146,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(eSvgAssets.hearing),
                              const HSpace(Insets.i8),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(homeScreenPvr.hearingOthers.toString(),
                                        style: appCss.dmDenseMedium16.textColor(
                                            appColor(context)
                                                .appTheme
                                                .primary)),
                                    Text('hear Other',
                                        style: appCss.dmDenseMedium14.textColor(
                                            appColor(context)
                                                .appTheme
                                                .rulesClr))
                                  ])
                            ]).paddingOnly(left: 10, top: 4)
                      ])),
              const Positioned(
                  left: 64,
                  top: 7,
                  child: CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
              const Positioned(
                  left: 60,
                  top: 16.75,
                  child:
                      CommonCircleDesign(height: Sizes.s10, width: Sizes.s10)),
              const Positioned(
                  left: 100,
                  top: 52,
                  child:
                      CommonCircleDesign(height: Sizes.s10, width: Sizes.s10))
            ]).inkWell(onTap: () => homeScreenPvr.onChantSelect(context)),
            const HSpace(Insets.i15),
            Stack(children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: appColor(context).appTheme.shadowClr,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                            spreadRadius: 0)
                      ],
                      color: appColor(context).appTheme.whiteColor),
                  height: Sizes.s68,
                  width: Sizes.s146,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(eSvgAssets.preaching),
                              const HSpace(Insets.i8),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(homeScreenPvr.preaching.toString(),
                                        style: appCss.dmDenseMedium16.textColor(
                                            appColor(context)
                                                .appTheme
                                                .primary)),
                                    Text("Preaching",
                                        style: appCss.dmDenseMedium14.textColor(
                                            appColor(context)
                                                .appTheme
                                                .rulesClr))
                                  ])
                            ]).paddingOnly(left: 10, top: 4)
                      ])),
              const Positioned(
                  right: 16,
                  top: 7,
                  child: CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
              const Positioned(
                  left: 66,
                  bottom: 2,
                  child:
                      CommonCircleDesign(height: Sizes.s10, width: Sizes.s10)),
              const Positioned(
                  left: 136,
                  top: 61,
                  child:
                      CommonCircleDesign(height: Sizes.s10, width: Sizes.s10))
            ]).inkWell(onTap: () => homeScreenPvr.onPreachingSelect(context)),
            const HSpace(Insets.i15),
            Stack(children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: appColor(context).appTheme.shadowClr,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                            spreadRadius: 0)
                      ],
                      color: appColor(context).appTheme.whiteColor),
                  height: Sizes.s68,
                  width: Sizes.s146,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(eSvgAssets.hearing),
                              const HSpace(Insets.i8),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        homeScreenPvr.otherActivities
                                            .toString(),
                                        style: appCss.dmDenseMedium16.textColor(
                                            appColor(context)
                                                .appTheme
                                                .primary)),
                                    Text('Other',
                                        style: appCss.dmDenseMedium14.textColor(
                                            appColor(context)
                                                .appTheme
                                                .rulesClr))
                                  ])
                            ]).paddingOnly(left: 10, top: 4)
                      ])),
              const Positioned(
                  left: 64,
                  top: 7,
                  child: CommonCircleDesign(height: Sizes.s6, width: Sizes.s6)),
              const Positioned(
                  left: 60,
                  top: 16.75,
                  child:
                      CommonCircleDesign(height: Sizes.s10, width: Sizes.s10)),
              const Positioned(
                  left: 100,
                  top: 52,
                  child:
                      CommonCircleDesign(height: Sizes.s10, width: Sizes.s10))
            ]).inkWell(onTap: () => homeScreenPvr.onChantSelect(context))
          ]));
    });
  }
}
