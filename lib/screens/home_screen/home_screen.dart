import 'dart:io';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/screens/home_screen/common_bottom_bar/common_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeScreenProvider,BottomNavProvider>(
        builder: (context1, homeScreenPvr,bottomPvr, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(DurationsClass.ms50)
              .then((value) => homeScreenPvr.onReady(context)),
          child: PopScope(
              canPop: false,
              onPopInvoked: (didPop) => showExitPopup(context),
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
                            HomeScreenBottomLayout()
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

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
                height: 90,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Do you want to exit?"),
                      const SizedBox(height: 20),
                      Row(children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  print('yes selected');
                                  exit(0);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red.shade800),
                                child: const Text("Yes"))),
                        const SizedBox(width: 15),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  print('no selected');
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white),
                                child: const Text("No",
                                    style: TextStyle(color: Colors.black))))
                      ])
                    ])));
      });
}
