import 'package:bhakti_app/common/assets/index.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/dashboard_provider.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (context1, dashboardPvr, child) {
      return SafeArea(
          child: Scaffold(
              extendBody: true,
              body: Stack(alignment: Alignment.center, children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(eImageAssets.splashBg)))),

              ])));
    });
  }
}
