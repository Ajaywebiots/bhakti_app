import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';

class UpdateCityTextFieldBox extends StatelessWidget {
  const UpdateCityTextFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(
        builder: (context, updateProfilePvr, child) {
      return CustomTitleWidget(
          height: 52,
          width: double.infinity,
          color: updateProfilePvr.cityValid == null
              ? const Color(0xff541F5C).withOpacity(.20)
              : appColor(context).appTheme.red,
          title: 'City',
          radius: 8,
          child: TextFieldCommon(
              controller: updateProfilePvr.city,
              validator: (value) => updateProfilePvr.cityTextField(value),
              hintText: "City",
              prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Insets.i14),
                    SvgPicture.asset(eSvgAssets.location, height: 25),
                    const HSpace(Insets.i12),
                    SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                    const HSpace(Insets.i20),
                  ]))).paddingSymmetric(vertical: 10);
    });
  }
}
