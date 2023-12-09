import 'package:bhakti_app/providers/setup_profile_provider.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/custom_title_widget.dart';

class UpdateStateTextFieldBox extends StatelessWidget {
  const UpdateStateTextFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileProvider>(
        builder: (context, profilePvr, child) {
      return CustomTitleWidget(
          height: 52,
          width: double.infinity,
          title: 'State',
          radius: 8,
          color: profilePvr.stateValid == null
              ? const Color(0xff541F5C).withOpacity(.20)
              : appColor(context).appTheme.red,
          child: TextFieldCommon(
              controller: profilePvr.state,
              validator: (value) {
                if (value!.isNotEmpty) {
                  profilePvr.stateValid = null;
                  profilePvr.notifyListeners();
                  return null;
                }
              },
              hintText: "State",
              prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const HSpace(Insets.i14),
                    SvgPicture.asset(eSvgAssets.map, height: 25),
                    const HSpace(Insets.i12),
                    SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                    const HSpace(Insets.i20)
                  ]))).paddingSymmetric(vertical: 10);
    });
  }
}
