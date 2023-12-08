import 'package:bhakti_app/config.dart';

class ProfileEditBottomLayout extends StatelessWidget {
  const ProfileEditBottomLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      UpdateCityTextFieldBox(),
      UpdateYatraNameTextBox(),
      UpdateInitiatedStatusBox(),
      UpdateInitiatedNameTextBox(),
      UpdateSpiritualMasterBox(),
      UpdateInitiatedDateBox(),
      UpdateMaritalStatusBox(),
    ]);
  }
}
