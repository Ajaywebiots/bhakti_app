import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/layouts/common_ruler_picker.dart';
import 'package:bhakti_app/screens/home_screen/layouts/mangla_Alert_List_layout.dart';
import 'package:bhakti_app/screens/home_screen/layouts/list_model.dart';
import 'package:bhakti_app/screens/home_screen/layouts/sandhya_alert_list_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Dialog(
        backgroundColor: Colors.transparent,
        alignment: Alignment.center,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            width: 335,
            height: widget.text == "Mangala Arti"
                ? 660
                : widget.text == "Sandhya Arti"
                    ? 580
                    : widget.text == "Bhagavadgita"
                        ? 490
                        : widget.text == "Hearing"
                            ? 490
                            : 420,
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
              CommonRulerPicker(
                  startValue: 1, maxValue: 12, onChange: widget.onHourChange!),
              Text(
                  textAlign: TextAlign.start,
                  widget.text2!,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).appTheme.primary)),
              const VSpace(Insets.i10),
              CommonRulerPicker(
                  startValue: 1, maxValue: 60, onChange: widget.onMinChange!),

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
                          children: manglaArtiTypeList.asMap().entries.map((e) {
                        return Column(children: [
                          ManglaAlertList(
                              status: e.value['isOn'],
                              text: e.value['artiType'],
                              onToggle: (val) {
                                e.value['isOn'] = val;
                                setState(() {

                                });
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
                              children:
                                  sandhyaTypeList.asMap().entries.map((e) {
                            return Column(children: [
                              SandhyaAlertList(
                                  status: e.value['isOn'],
                                  text: e.value['artiType'],
                                  onToggle: (val) {
                                    e.value['isOn'] = val;
                                    setState(() {

                                    });
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
                              width: 305,
                              height: 44,
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
                                    const Text("Chapter 1"),
                                    SvgPicture.asset("assets/svg/arrow-up1.svg")
                                  ]))
                          : widget.text == "Hearing"
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  width: 305,
                                  height: 44,
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
                                        const Text("Speaker 1"),
                                        SvgPicture.asset(
                                            "assets/svg/arrow-up1.svg")
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: appColor(context).appTheme.primary),
                            borderRadius: BorderRadius.circular(8)),
                        height: 44,
                        width: 120,
                        child: Text("Cancel",
                            style: appCss.dmDenseMedium14
                                .textColor(appColor(context).appTheme.primary)))
                    .inkWell(onTap: () {
                  Navigator.pop(context);
                }),
                Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: appColor(context).appTheme.primary),
                        height: 44,
                        width: 120,
                        child: Text("Save",
                            style: appCss.dmDenseMedium14.textColor(
                                appColor(context).appTheme.whiteColor)))
                    .inkWell(onTap: () {
                  Navigator.pop(context);
                })
              ])
            ]).paddingAll(15)));
  }
}