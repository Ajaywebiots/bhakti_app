import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';

class UpdateDateOfBirthBox extends StatelessWidget {
  const UpdateDateOfBirthBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(
        builder: (context, updateProfilePvr, child) {
      return CustomTitleWidget(
          height: 52,
          color: updateProfilePvr.dateValid == null
              ? const Color(0xff541F5C).withOpacity(.20)
              : appColor(context).appTheme.red,
          width: double.infinity,
          title: 'Date Of Birth',
          radius: 8,
          child: TextFieldCommon(
              hintText: 'Date Of Birth',
              validator: (value) => updateProfilePvr.dobValidator(value),
              readOnly: true,
              controller: updateProfilePvr.dob,
              onTap: () => updateProfilePvr.dobTextPicker(context),
              prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Insets.i20),
                    SvgPicture.asset(eSvgAssets.cake, height: 20),
                    const HSpace(Insets.i10),
                    SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                    const HSpace(Insets.i20)
                  ]))).paddingSymmetric(vertical: 10);
    });
  }
}
