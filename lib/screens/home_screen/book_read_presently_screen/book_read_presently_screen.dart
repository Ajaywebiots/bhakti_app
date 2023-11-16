import 'dart:developer';

import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/layouts/list_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bhakti_app/common/assets/index.dart';

class BookReadPresentlyScreen extends StatelessWidget {
  const BookReadPresentlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            titleSpacing: 0,
            leadingWidth: 0,
            title: Row(children: [
              const HSpace(Insets.i20),
              SvgPicture.asset("assets/svg/arrowLeft.svg"),
              const HSpace(Insets.i12),
              Text("Books Reading Presently",
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, children: [
                const VSpace(Insets.i120),

                Container(height: 50,
                    decoration: BoxDecoration(color: const Color(0x0FC35DD2),
                        border: Border.all(
                            color: appColor(context).appTheme.primary
                                .withOpacity(
                                0.20)),
                        borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search Here',
                            prefixIcon: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/svg/search-normal.svg"),
                                const HSpace(Insets.i10),
                                SvgPicture.asset(eSvgAssets.line)
                              ],
                            ).paddingAll(10),
                            disabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppRadius.r8)),
                                borderSide: BorderSide.none),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppRadius.r8)),
                                borderSide: BorderSide.none),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppRadius.r8)),
                                borderSide: BorderSide.none),
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppRadius.r8)),
                                borderSide: BorderSide.none)
                        ),
                        onSubmitted: (String value) {
                          debugPrint(value);
                        }
                    )
                ),
                const VSpace(Insets.i15),
                Row(children: [
                  Text("Book list",
                      style: appCss.philosopherBold18
                          .textColor(appColor(context).appTheme.oneText))
                ]),
                const VSpace(Insets.i15),
                Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        color: appColor(context).appTheme.whiteColor,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              color: appColor(context).appTheme.shadowClr,
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                              spreadRadius: 0)
                        ]),
                    child: ListView.builder(
                        itemCount: bookReadingList.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(15),
                        itemBuilder: (context, index) {
                          log(
                              "bookReadingList[index]['isAdded']${bookReadingList[index]['isAdded']}");
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                4),
                                            child: Image.asset(
                                                bookReadingList[index]['book'],
                                                height: 70,
                                                width: 50)),
                                        const HSpace(Insets.i12),
                                        Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  bookReadingList[index]
                                                  ['bookName'],
                                                  style: appCss.dmDenseMedium16
                                                      .textColor(
                                                      appColor(context)
                                                          .appTheme
                                                          .rulesClr)),
                                              Text(
                                                  bookReadingList[index]['author'],
                                                  style: appCss.dmDenseRegular12
                                                      .textColor(
                                                      appColor(context)
                                                          .appTheme
                                                          .lightText))
                                            ])
                                      ]),
                                      Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(6),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: appColor(context)
                                                        .appTheme
                                                        .shadowClr,
                                                    blurRadius: 16,
                                                    offset: const Offset(0, 4),
                                                    spreadRadius: 0)
                                              ],
                                              color: appColor(context)
                                                  .appTheme
                                                  .whiteColor),
                                          width: 34,
                                          height: 35,
                                          child: bookReadingList[index]
                                          ['isAdded'] ==
                                              true
                                              ? SvgPicture.asset(
                                              "assets/svg/delete.svg")
                                              : SvgPicture.asset(
                                              eSvgAssets.add))
                                          .inkWell(onTap: () {
                                        bookReadingList[index]['isAdded'] ==
                                            true
                                            ? showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8)
                                                  ),
                                                  child: SizedBox(
                                                      height: 175,
                                                      child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            Center(
                                                                child: Text(
                                                                    "Delete Book",
                                                                    style: appCss
                                                                        .philosopherBold18
                                                                        .textColor(
                                                                        appColor(
                                                                            context)
                                                                            .appTheme
                                                                            .primary))),
                                                            const VSpace(
                                                                Insets.i10),
                                                            Center(
                                                                child: Text(
                                                                    "Are You Sure You Want to Delete This Book?",
                                                                    style: appCss
                                                                        .dmDenseRegular14
                                                                        .textColor(
                                                                        appColor(
                                                                            context)
                                                                            .appTheme
                                                                            .rulesClr))),
                                                            Center(
                                                                child: Text(
                                                                    style: appCss
                                                                        .dmDenseRegular14
                                                                        .textColor(
                                                                        appColor(
                                                                            context)
                                                                            .appTheme
                                                                            .rulesClr),
                                                                    "This Action Can’t Be Undone.")),
                                                            const VSpace(
                                                                Insets.i25),
                                                            Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                      alignment:
                                                                      Alignment
                                                                          .center,
                                                                      decoration: BoxDecoration(
                                                                          border: Border
                                                                              .all(
                                                                              width:
                                                                              1,
                                                                              color: appColor(
                                                                                  context)
                                                                                  .appTheme
                                                                                  .primary),
                                                                          borderRadius: BorderRadius
                                                                              .circular(
                                                                              8)),
                                                                      height:
                                                                      44,
                                                                      width:
                                                                      120,
                                                                      child: Text(
                                                                          "Cancel",
                                                                          style: appCss
                                                                              .dmDenseMedium14
                                                                              .textColor(
                                                                              appColor(
                                                                                  context)
                                                                                  .appTheme
                                                                                  .primary)))
                                                                      .inkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator
                                                                            .pop(
                                                                            context);
                                                                      }),
                                                                  Container(
                                                                      alignment:
                                                                      Alignment
                                                                          .center,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius
                                                                              .circular(
                                                                              8),
                                                                          color: appColor(
                                                                              context)
                                                                              .appTheme
                                                                              .primary),
                                                                      height:
                                                                      44,
                                                                      width:
                                                                      120,
                                                                      child: Text(
                                                                          "Save",
                                                                          style: appCss
                                                                              .dmDenseMedium14
                                                                              .textColor(
                                                                              appColor(
                                                                                  context)
                                                                                  .appTheme
                                                                                  .whiteColor)))
                                                                      .inkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator
                                                                            .pop(
                                                                            context);
                                                                      })
                                                                ])
                                                          ]
                                                      ))
                                              );
                                            })
                                            : Container();
                                      })
                                    ]),
                                index == bookReadingList.length - 1
                                    ? Container()
                                    : const VSpace(Insets.i10),
                                index == bookReadingList.length - 1
                                    ? Container()
                                    : SvgPicture.asset(eSvgAssets.lineRuler),
                                index == bookReadingList.length - 1
                                    ? Container()
                                    : const VSpace(Insets.i10)
                              ]);
                        }))
              ]).paddingSymmetric(horizontal: 20)
          )
        ]));
  }
}