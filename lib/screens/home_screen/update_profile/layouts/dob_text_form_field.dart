import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/providers/update_profile_provider.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../common/assets/index.dart';
import '../../../../config.dart';
import '../../../../widgets/custom_title_widget.dart';

class UpdateDateOfBirthBox extends StatelessWidget {
  const UpdateDateOfBirthBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(
      builder: (context, profilePvr, child) {
        return CustomTitleWidget(
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
                if (value!.isEmpty) {
                  profilePvr.dateValid = "Enter Dob";
                  profilePvr.notifyListeners();
                  return "Enter Dob";
                } else {
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
                            primary: appColor(context).appTheme.whiteColor,
                            backgroundColor: appColor(context).appTheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('dd MMM yyyy').format(pickedDate);

                  profilePvr.dob.text = formattedDate;
                  profilePvr.notifyListeners();
                } else {}
              },
              prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Sizes.s20),
                    SvgPicture.asset(eSvgAssets.cake, height: 20),
                    const HSpace(Sizes.s10),
                    SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                    const HSpace(Sizes.s20),
                  ])),
        ).paddingSymmetric(vertical: 10);
      },
    );
  }
}
