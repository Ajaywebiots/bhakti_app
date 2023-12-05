import 'layouts/homescreen_bottom_layout.dart';
import 'layouts/homescreen_upper_layout.dart';
import 'layouts/notes_layout.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/widgets/common_app_bar.dart';
import 'package:bhakti_app/common/extension/spacing.dart';
import 'package:bhakti_app/widgets/stateful_wrapper.dart';
import 'package:bhakti_app/providers/home_screen_provider.dart';
import 'package:bhakti_app/common/extension/widget_extension.dart';
import 'package:bhakti_app/screens/home_screen/drawer_screen/drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context1, homeScreenPvr, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(DurationsClass.ms150)
              .then((value) => homeScreenPvr.onReady(context)),
          child: SafeArea(
              child: Scaffold(
                  drawer: const DrawerScreen(),
                  extendBody: true,
                  body: Stack(alignment: Alignment.center, children: [
                    Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(eImageAssets.splashBg)))),
                    SingleChildScrollView(
                        child: const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          CommonAppBar(),
                          VSpace(Insets.i23),
                          HomeScreenUpperLayout(),
                          HomeScreenBottomLayout(),
                          VSpace(Insets.i15),
                          NotesLayout()
                        ]).paddingOnly(
                            top: MediaQuery.of(context).size.height * 0.01,
                            bottom: MediaQuery.of(context).size.height * 0.05,
                            left: Insets.i20,
                            right: Insets.i20))
                  ]))));
    });
  }
}
