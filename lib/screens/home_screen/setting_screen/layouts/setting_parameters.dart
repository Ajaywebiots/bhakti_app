import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/common_app_bar.dart';
import 'package:bhakti_app/widgets/common_selection_button.dart';
import 'package:bhakti_app/widgets/parameter_textfield.dart';

class SettingParameters extends StatelessWidget {
  const SettingParameters({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(builder: (context, settingPvr, child) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: Stack(alignment: Alignment.topLeft, children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(eImageAssets.splashBg)))),
            SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  CommonAppBar(
                      text: appFonts.parameters,
                      hSpace: Insets.i90,
                      onTap: () => Navigator.pop(context)),
                  const VSpace(Insets.i25),
                  const ParameterTextField(),
                  CommonSelectionButton(
                          textTwo: appFonts.delete,
                          onTapOne: () => Navigator.pop(context),
                          onTapTwo: () => Navigator.pop(context))
                      .marginSymmetric(vertical: Insets.i20)
                ]).paddingSymmetric(horizontal: 20))
          ]));
    });
  }
}
