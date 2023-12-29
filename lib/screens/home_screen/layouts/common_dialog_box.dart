import 'dart:developer';
import 'package:bhakti_app/config.dart';
import '../../../customise/custom_wheel_silder/wheel_slider.dart';

class CommonDialog extends StatefulWidget {
  final ValueSetter<int>? onHourChange;
  final ValueSetter<int>? onMinChange;
  final String? text, text1, text2;

  const CommonDialog(
      {super.key,
      this.onHourChange,
      this.onMinChange,
      this.text,
      this.text1,
      this.text2});

  @override
  State<CommonDialog> createState() => _CommonDialogState();
}

class _CommonDialogState extends State<CommonDialog> {
  @override
  Widget build(BuildContext context) {
    int currentValue = 1;
    const int totalCount = 60;
    const int initValue = 4;
    return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        backgroundColor: Colors.transparent,
        alignment: Alignment.center,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            width: double.infinity,
            height: widget.text == "Mangala Arti"
                ? Sizes.s660
                : widget.text == "Sandhya Arti"
                    ? Sizes.s580
                    : widget.text == "Bhagavadgita"
                        ? Sizes.s490
                        : widget.text == "Hearing"
                            ? Sizes.s490
                            : Sizes.s420,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                      child: Text(widget.text!,
                          style: appCss.philosopherBold18
                              .textColor(appColor(context).appTheme.primary)))
                  .paddingSymmetric(vertical: 20),
              Text(
                  textAlign: TextAlign.start,
                  widget.text1!,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).appTheme.primary)),
              const VSpace(Insets.i32),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("$currentValue",
                    style: const TextStyle(
                        fontSize: 18, height: 2.0, fontWeight: FontWeight.w500))
              ]),

              WheelSlider(
                  isInfinite: false,
                  horizontalListWidth: 300,
                  customPointer: SvgPicture.asset("assets/svg/ruler.svg")
                      .paddingOnly(top: 40),
                  totalCount: totalCount,
                  initValue: initValue,
                  onValueChanged: (val) {
                    setState(() {
                      currentValue = val;
                    });
                    log("$currentValue");
                  }),
              Text(
                  textAlign: TextAlign.start,
                  widget.text2!,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).appTheme.primary)),
              const VSpace(Insets.i10),
              // CommonRulerPicker(
              //     startValue: 1, maxValue: 60, onChange: widget.onMinChange!),
              widget.text == "Mangala Arti"
                  ? const VSpace(Insets.i25)
                  : widget.text == "Sandhya Arti"
                      ? const VSpace(Insets.i25)
                      : widget.text == "Bhagavadgita"
                          ? const VSpace(Insets.i25)
                          : widget.text == "Hearing"
                              ? const VSpace(Insets.i25)
                              : const VSpace(Insets.i20),
              widget.text == 'Mangala Arti'
                  ? Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: appColor(context).appTheme.whiteColor),
                      child: Column(
                          children: appArray.manglaArtiTypeList
                              .asMap()
                              .entries
                              .map((e) {
                        return Column(children: [
                          ManglaAlertList(
                              status: e.value['isOn'],
                              text: e.value['artiType'],
                              onToggle: (val) {
                                e.value['isOn'] = val;
                                setState(() {});
                              }),
                          const VSpace(Sizes.s10),
                          e.key == 4
                              ? Container()
                              : SvgPicture.asset(eSvgAssets.lineRuler),
                          e.key == 4 ? Container() : const VSpace(Sizes.s10)
                        ]);
                      }).toList()))
                  : widget.text == "Sandhya Arti"
                      ? Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: appColor(context).appTheme.whiteColor,
                          ),
                          child: Column(
                              children: appArray.sandhyaTypeList
                                  .asMap()
                                  .entries
                                  .map((e) {
                            return Column(children: [
                              SandhyaAlertList(
                                  status: e.value['isOn'],
                                  text: e.value['artiType'],
                                  onToggle: (val) {
                                    e.value['isOn'] = val;
                                    setState(() {});
                                  }),
                              const VSpace(Sizes.s10),
                              e.key == 4
                                  ? Container()
                                  : SvgPicture.asset(eSvgAssets.lineRuler),
                              e.key == 4 ? Container() : const VSpace(Sizes.s10)
                            ]);
                          }).toList()))
                      : widget.text == "Bhagavadgita"
                          ? Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              width: Sizes.s305,
                              height: Sizes.s44,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      borderRadius: BorderRadius.circular(6),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(appFonts.speaker1),
                                        SvgPicture.asset(eSvgAssets.arrowDown1)
                                      ]))
                              : Container(),
              widget.text == "Mangala Arti"
                  ? const VSpace(Insets.i10)
                  : widget.text == "Sandhya Arti"
                      ? const VSpace(Insets.i10)
                      : widget.text == "Bhagavadgita"
                          ? const VSpace(Insets.i30)
                          : widget.text == "Hearing"
                              ? const VSpace(Insets.i30)
                              : const VSpace(Insets.i10),
              CommonSelectionButton(
                  onTapOne: () => Navigator.pop(context),
                  onTapTwo: () => Navigator.pop(context))
            ]).paddingAll(15)));
  }
}
