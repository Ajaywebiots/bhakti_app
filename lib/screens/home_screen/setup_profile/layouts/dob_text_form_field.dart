import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/setup_profile_provider.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';

import '../../../../common/assets/index.dart';

class DateOfBirthBox extends StatelessWidget {
  const DateOfBirthBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SetUpProfileProvider>(
      builder: (context, profilePvr, child) {
        return CustomTitleWidget(
          height: Sizes.s52,
          color: profilePvr.dateValid == null
              ? const Color(0xff541F5C).withOpacity(.20)
              : appColor(context).appTheme.red,
          width: double.infinity,
          title: 'Date Of Birth',
          radius: 8,
          child: TextFieldCommon(
              hintText: 'Date Of Birth',
              validator: (value) {
                if (value!.isNotEmpty) {
                  profilePvr.dateValid = null;
                  profilePvr.notifyListeners();
                  return null;
                }
              },
              readOnly: true,
              controller: profilePvr.dob,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1886),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                          data: Theme.of(context).copyWith(
                              dialogTheme: DialogTheme(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0), // this is the border radius of the picker
                                ),
                              ),
                              colorScheme: ColorScheme.light(
                                primary: appColor(context).appTheme.primary,
                                onSurface: Colors.black,
                                error: Colors.red,
                              ),
                              textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      primary:
                                          appColor(context).appTheme.whiteColor,
                                      backgroundColor:
                                          appColor(context).appTheme.primary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))))),
                          child: child!);
                    });

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  profilePvr.dob.text = formattedDate;
                  profilePvr.notifyListeners();
                } else {}
              },
              prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Insets.i20),
                    SvgPicture.asset(eSvgAssets.cake, height: Sizes.s20),
                    const HSpace(Insets.i10),
                    SvgPicture.asset(eSvgAssets.line, height: Sizes.s24, width: Sizes.s24),
                    const HSpace(Insets.i20),
                  ])),
        ).paddingSymmetric(vertical: 10);
      },
    );
  }
}
