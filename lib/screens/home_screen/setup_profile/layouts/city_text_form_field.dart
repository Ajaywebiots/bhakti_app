import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';

class CityTextFieldBox extends StatelessWidget {
  const CityTextFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SetUpProfileProvider>(
        builder: (context, profilePvr, child) {
      return CustomTitleWidget(
          height: 52,
          width: double.infinity,
          color: profilePvr.cityValid == null
              ? const Color(0xff541F5C).withOpacity(.20)
              : appColor(context).appTheme.red,
          title: 'City',
          radius: 8,
          child: TextFieldCommon(
              controller: profilePvr.city,
              validator: (value) => profilePvr.cityValidator(value),
              hintText: "City",
              prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Insets.i14),
                    SvgPicture.asset(eSvgAssets.location, height: 25),
                    const HSpace(Insets.i12),
                    SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                    const HSpace(Insets.i20)
                  ]))).paddingSymmetric(vertical: 10);
    });
  }
}
