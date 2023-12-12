import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/widgets/loading_component.dart';

class SetUpProfile extends StatefulWidget {
  const SetUpProfile({super.key});

  @override
  State<SetUpProfile> createState() => _SetUpProfileState();
}

class _SetUpProfileState extends State<SetUpProfile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SetUpProfileProvider>(
        builder: (context1, setUpProfilePvr, child) {
      return LoadingComponent(
          child: StatefulWrapper(
              onInit: () => Future.delayed(
                  DurationsClass.ms150, () => setUpProfilePvr.onReady(context)),
              child: Scaffold(
                  key: setUpProfilePvr.scaffoldKey,
                  extendBodyBehindAppBar: true,
                  body: CommonBgImage(
                      widget: SingleChildScrollView(
                          child: Form(
                              key: setUpProfilePvr.formKey,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const VSpace(Sizes.s15),
                                    Text(appFonts.setUp,
                                        style: appCss.philosopherBold28),
                                    const VSpace(Sizes.s10),
                                    Text(appFonts.enterYourDetails,
                                        style: appCss.dmDenseRegular14
                                            .textColor(appColor(context)
                                                .appTheme
                                                .lightText)),
                                    const VSpace(Insets.i20),
                                    const Center(child: ProfilePicture()),
                                    const PersonalInfoExpansionTile(),
                                    const ContactInfoExpansionTile(),
                                    const VSpace(Insets.i18),
                                    Center(
                                        child: CommonButton(
                                            width: Sizes.s141,
                                            onTap: () => setUpProfilePvr
                                                .saveData(context),
                                            text: appFonts.save))
                                  ]).marginSymmetric(
                                  horizontal: 20, vertical: 60)))))));
    });
  }
}
