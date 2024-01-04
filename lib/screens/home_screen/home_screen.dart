import 'package:bhakti_app/config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeScreenProvider, BottomNavProvider>(
        builder: (context1, homeScreenPvr, bottomPvr, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(DurationsClass.ms50)
              .then((value) => homeScreenPvr.onReady(context)),
          child: PopScope(
              canPop: false,
              onPopInvoked: (didPop) => homeScreenPvr.showExitPopup(context),
              child: SafeArea(
                  child: Scaffold(
                      drawer: const DrawerScreen(),
                      extendBody: true,
                      body: CommonBgImage(
                          widget: SingleChildScrollView(
                              child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                            HomeAppBar(),
                            VSpace(Insets.i23),
                            HomeScreenUpperLayout(),
                            HomeScreenBottomLayout(),

                          ]).paddingOnly(
                                  top:
                                      MediaQuery.of(context).size.height * 0.01,
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.05,
                                  left: Insets.i20,
                                  right: Insets.i20)))))));
    });
  }
}
