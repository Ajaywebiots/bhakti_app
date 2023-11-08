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
    return Consumer<SetUpUpdateProfileProvider>(builder: (context, profilePvr, child) {
        return   CustomTitleWidget(
          height: 52,
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
                    lastDate: DateTime.now());

                if (pickedDate != null) {

                  String formattedDate = DateFormat('yyyy-MM-dd')
                      .format(pickedDate);

                  profilePvr.dob.text = formattedDate;
                  profilePvr.notifyListeners();
                } else {

                }
              },
              prefixIcon: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Insets.i20),
                    SvgPicture.asset(eSvgAssets.cake, height: 20),
                    const HSpace(Insets.i10),
                    SvgPicture.asset(eSvgAssets.line,
                        height: 24, width: 24),
                    const HSpace(Insets.i20),
                  ])),
        ).paddingSymmetric(vertical: 10);
      },
    );
  }
}
