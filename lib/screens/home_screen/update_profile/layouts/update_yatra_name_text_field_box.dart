import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';

class UpdateYatraNameTextBox extends StatelessWidget {
  const UpdateYatraNameTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(
        builder: (context, updateProfilePvr, child) {
      return CustomTitleWidget(
          height: 52,
          width: double.infinity,
          title: 'Yatra Name',
          color: updateProfilePvr.yatraNameValid == null
              ? const Color(0xff541F5C).withOpacity(.20)
              : appColor(context).appTheme.red,
          radius: 8,
          child: TextFieldCommon(
              controller: updateProfilePvr.yatraName,
              validator: (value) => updateProfilePvr.yatraNameValidator(value),
              hintText: "Yatra Name",
              prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Sizes.s20),
                    SvgPicture.asset(eSvgAssets.call1, height: 20),
                    const HSpace(Sizes.s12),
                    SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                    const HSpace(Sizes.s20)
                  ]))).paddingSymmetric(vertical: 10);
    });
  }
}
