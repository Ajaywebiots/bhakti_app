import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/providers/update_profile_provider.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../../config.dart';
import '../../../../widgets/custom_title_widget.dart';

class UpdateInitiatedDateBox extends StatelessWidget {
  const UpdateInitiatedDateBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(builder: (context,profilePvr,child) {
        return CustomTitleWidget(
          height: 52,
          width: double.infinity,
          title: 'Initiated Date',
          color: profilePvr.initiatedDateValid == null
              ? const Color(0xff541F5C).withOpacity(.20)
              : appColor(context).appTheme.red,
          radius: 8,
          child: TextFieldCommon(
              validator: (value) {
                if (value!.isEmpty) {
                  profilePvr.initiatedDateValid = 'Enter a Initiated Date!';
                  profilePvr.notifyListeners();
                  return 'Enter a Initiated Date!';
                } else {
                  profilePvr.initiatedDateValid = null;
                  profilePvr.notifyListeners();
                  return null;
                }
              },
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2025),
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
                  },);

                if (pickedDate != null) {
                  String formatDate =
                      DateFormat('dd MMM yyyy').format(pickedDate);

                  profilePvr.initiatedDate.text = formatDate;
                  profilePvr.notifyListeners();
                } else {}
              },
              readOnly: true,
              hintText: "Initiated Date",
              controller: profilePvr.initiatedDate,
              prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Sizes.s16),
                    SvgPicture.asset(eSvgAssets.calendar, height: 25),
                    const HSpace(Sizes.s12),
                    SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                    const HSpace(Sizes.s20),
                  ])),
        ).paddingSymmetric(vertical: 10);
      },
    );
  }
}
