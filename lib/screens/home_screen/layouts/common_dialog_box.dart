import 'package:bhakti_app/config.dart';

class CommonDialog extends StatefulWidget {
  final String? text, text1, text2;

  const CommonDialog({super.key, this.text, this.text1, this.text2});

  @override
  State<CommonDialog> createState() => _CommonDialogState();
}

class _CommonDialogState extends State<CommonDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, homeScreenPvr, child) {
        return Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            backgroundColor: Colors.transparent,
            alignment: Alignment.center,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                width: double.infinity,
                height: Sizes.s490,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text(widget.text!,
                              style: appCss.philosopherBold18.textColor(
                                  appColor(context).appTheme.primary)))
                          .paddingSymmetric(vertical: 20),
                      Text(
                          textAlign: TextAlign.start,
                          widget.text1!,
                          style: appCss.dmDenseMedium14
                              .textColor(appColor(context).appTheme.primary)),
                      const VSpace(Insets.i15),
                      // SingleChildScrollView(
                      //     physics: const BouncingScrollPhysics(),
                      //     child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           WheelSlider.number(
                      //               horizontal: true,
                      //               horizontalListWidth: 400.0,
                      //               itemSize: 50.0,
                      //               perspective: 0.002,
                      //               totalCount: homeScreenPvr.nTotalCount,
                      //               initValue: homeScreenPvr.nInitValue,
                      //               unSelectedNumberStyle: const TextStyle(
                      //                   fontSize: 18, color: Colors.black54),
                      //               selectedNumberStyle: TextStyle(
                      //                   fontSize: 24,
                      //                   fontWeight: FontWeight.bold,
                      //                   color:
                      //                       appColor(context).appTheme.primary),
                      //               currentIndex: homeScreenPvr.nCurrentValue,
                      //               onValueChanged: (val) =>
                      //                   homeScreenPvr.onFirstChanged(val),
                      //               hapticFeedbackType: CustomWheelSlider
                      //                   .HapticFeedbackType.heavyImpact,
                      //               interval: 1,
                      //               squeeze: 0.9,
                      //               pointerWidth: 40,
                      //               pointerHeight: 40,
                      //               isInfinite: false,
                      //               isVibrate: true,
                      //               allowPointerTappable: true)
                      //         ])),
                      // const VSpace(Insets.i10),
                      // Text(
                      //     textAlign: TextAlign.start,
                      //     widget.text2!,
                      //     style: appCss.dmDenseMedium14
                      //         .textColor(appColor(context).appTheme.primary)),
                      // const VSpace(Insets.i15),
                      // SingleChildScrollView(
                      //     physics: const BouncingScrollPhysics(),
                      //     child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           WheelSlider.number(
                      //               horizontal: true,
                      //               horizontalListWidth: 400.0,
                      //               itemSize: 50.0,
                      //               perspective: 0.002,
                      //               totalCount: homeScreenPvr.nTotalCount1,
                      //               initValue: homeScreenPvr.nInitValue1,
                      //               unSelectedNumberStyle: const TextStyle(
                      //                   fontSize: 18, color: Colors.black54),
                      //               selectedNumberStyle: TextStyle(
                      //                   fontSize: 24,
                      //                   fontWeight: FontWeight.bold,
                      //                   color:
                      //                       appColor(context).appTheme.primary),
                      //               currentIndex: homeScreenPvr.nCurrentValue1,
                      //               onValueChanged: (val) =>
                      //                   homeScreenPvr.onSecondChanged(val),
                      //               hapticFeedbackType: CustomWheelSlider
                      //                   .HapticFeedbackType.heavyImpact,
                      //               interval: 1,
                      //               squeeze: 0.9,
                      //               pointerWidth: 40,
                      //               pointerHeight: 40,
                      //               isInfinite: false,
                      //               isVibrate: true,
                      //               allowPointerTappable: true)
                      //         ])),
                      const VSpace(Insets.i10),
                      const VSpace(Insets.i25),
                      widget.text == "Bhagavadgita"
                          ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15),
                          width: Sizes.s305,
                          height: Sizes.s44,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                    color: appColor(context)
                                        .appTheme
                                        .shadowClr,
                                    blurRadius: 12,
                                    offset: const Offset(0, 2),
                                    spreadRadius: 0)
                              ]),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(appFonts.chapter1),
                                SvgPicture.asset(eSvgAssets.arrowDown1)
                              ]))
                          : widget.text == "Hearing"
                          ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15),
                          width: Sizes.s305,
                          height: Sizes.s44,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                    color: appColor(context)
                                        .appTheme
                                        .shadowClr,
                                    blurRadius: 12,
                                    offset: const Offset(0, 2),
                                    spreadRadius: 0)
                              ]),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(appFonts.speaker1),
                                SvgPicture.asset(eSvgAssets.arrowDown1)
                              ]))
                          : Container(),
                      const VSpace(Insets.i30),
                      const VSpace(Insets.i10),
                      CommonSelectionButton(
                          onTapOne: () => Navigator.pop(context),
                          onTapTwo: () => Navigator.pop(context))
                    ]).paddingAll(15)));
      },
    );
  }
}
