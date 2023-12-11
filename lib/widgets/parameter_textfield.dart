import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/text_common_widget.dart';
import 'custom_title_widget.dart';

class ParameterTextField extends StatelessWidget {
  const ParameterTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(builder: (context, settingPvr, child) {
      return Column(children: [
        CustomTitleWidget(
            height: 52,
            width: double.infinity,
            title: 'Number of Rounds Chanting',
            color: const Color(0xff541F5C).withOpacity(.20),
            radius: 8,
            child: TextFieldCommon(
                keyboardType: TextInputType.emailAddress,
                controller: settingPvr.numberOfRound,
                prefixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const HSpace(Insets.i20),
                      SvgPicture.asset(eSvgAssets.calculator, height: 20),
                      const HSpace(Insets.i10),
                      SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                      const HSpace(Insets.i20)
                    ]))).paddingSymmetric(vertical: 10),
        CustomTitleWidget(
            height: 52,
            width: double.infinity,
            title: 'Average Time for Each Round',
            color: const Color(0xff541F5C).withOpacity(.20),
            radius: 8,
            child: TextFieldCommon(
                keyboardType: TextInputType.emailAddress,
                controller: settingPvr.averageTime,
                prefixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const HSpace(Insets.i20),
                      SvgPicture.asset(eSvgAssets.clock, height: 20),
                      const HSpace(Insets.i10),
                      SvgPicture.asset(eSvgAssets.line, height: 24, width: 24),
                      const HSpace(Insets.i20)
                    ]))).paddingSymmetric(vertical: 10)
      ]);
    });
  }
}
