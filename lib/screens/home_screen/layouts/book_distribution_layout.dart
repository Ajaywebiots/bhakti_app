import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookDistributionLayout extends StatelessWidget {
  const BookDistributionLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, homeProviderPvr, child) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: appColor(context)
                                  .appTheme
                                  .shadowClr,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                              spreadRadius: 0)
                        ],
                        color: appColor(context)
                            .appTheme
                            .whiteColor),
                    height: Sizes.s86,
                    child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                const HSpace(Insets.i8),
                                SvgPicture.asset(eSvgAssets
                                    .bookDistribution),
                                const HSpace(Insets.i8),
                                Text("10",
                                    style: appCss
                                        .dmDenseBold24
                                        .textColor(
                                        appColor(context)
                                            .appTheme
                                            .primary)),
                              ]),
                          Text("Small Books",
                              style: appCss.dmDenseMedium12
                                  .textColor(
                                  appColor(context)
                                      .appTheme
                                      .lightText))
                              .paddingOnly(left: 8)
                        ]))),
            const HSpace(Insets.i10),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: appColor(context)
                                  .appTheme
                                  .shadowClr,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                              spreadRadius: 0)
                        ],
                        color: appColor(context)
                            .appTheme
                            .whiteColor),
                    height: Sizes.s86,
                    child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                const HSpace(Insets.i8),
                                SvgPicture.asset(eSvgAssets
                                    .bookDistribution),
                                const HSpace(Insets.i8),
                                Text("5",
                                    style: appCss
                                        .dmDenseBold24
                                        .textColor(
                                        appColor(context)
                                            .appTheme
                                            .primary))
                              ]),
                          Text("Medium Books",
                              style: appCss.dmDenseMedium12
                                  .textColor(
                                  appColor(context)
                                      .appTheme
                                      .lightText))
                              .paddingOnly(left: 8)
                        ]))),
            const HSpace(Insets.i10),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: appColor(context)
                                  .appTheme
                                  .shadowClr,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                              spreadRadius: 0)
                        ],
                        color: appColor(context)
                            .appTheme
                            .whiteColor),
                    height: Sizes.s86,
                    child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                const HSpace(Insets.i8),
                                SvgPicture.asset(eSvgAssets
                                    .bookDistribution),
                                const HSpace(Insets.i8),
                                Text("1",
                                    style: appCss
                                        .dmDenseBold24
                                        .textColor(
                                        appColor(context)
                                            .appTheme
                                            .primary))
                              ]),
                          Text("Large Books",
                              style: appCss.dmDenseMedium12
                                  .textColor(
                                  appColor(context)
                                      .appTheme
                                      .lightText))
                              .paddingOnly(left: 8)
                        ])))
          ]);
    },);
  }
}
