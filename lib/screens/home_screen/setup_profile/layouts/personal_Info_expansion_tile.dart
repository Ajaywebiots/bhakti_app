import '../../../../config.dart';

class PersonalInfoExpansionTile extends StatelessWidget {
  const PersonalInfoExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SetUpProfileProvider>(
        builder: (context1, setUpProfilePvr, child) {
      return ExpansionTile(
          onExpansionChanged: (value) =>
              setUpProfilePvr.onPersonalInfoExpansionChanged(),
          tilePadding: EdgeInsets.zero,
          trailing: SvgPicture.asset(setUpProfilePvr.onChange == false
              ? eSvgAssets.arrowDown1
              : eSvgAssets.arrowUp),
          leading: Text(appFonts.personalInfo,
              style: appCss.philosopherBold18
                  .textColor(appColor(context).appTheme.lightText)),
          title: SvgPicture.asset(eSvgAssets.profileLine,
                  width: Sizes.s200, fit: BoxFit.fill)
              .paddingOnly(top: Insets.i5),
          children: const <Widget>[
            NameTextBox(),
            VSpace(Insets.i18),
            InitiatedNameTextBox(),
            VSpace(Insets.i18),
            EmailTextBox(),
            VSpace(Insets.i18),
            DateOfBirthBox(),
            VSpace(Insets.i18),
            GenderRadioBox()
          ]);
    });
  }
}
