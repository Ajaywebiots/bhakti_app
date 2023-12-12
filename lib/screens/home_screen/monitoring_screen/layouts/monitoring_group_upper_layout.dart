import '../../../../config.dart';

class MonitoringGroupUpperLayout extends StatelessWidget {
  const MonitoringGroupUpperLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MonitoringProvider>(
        builder: (context, monitoringPvr, child) {
      return SizedBox(
          height: 50,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                bool isSelected = index == monitoringPvr.selectedIndex;
                if (index == 0) {
                  return Container(
                          width: 43,
                          height: 43,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: appColor(context).appTheme.primary),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 15),
                          child: Text(appFonts.all,
                              style: appCss.dmDenseMedium12.textColor(
                                  appColor(context).appTheme.whiteColor)))
                      .inkWell(onTap: () => monitoringPvr.allUserData());
                } else {
                  return Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: Image.asset(eImageAssets.userSection,
                              height: 43, width: 43))
                      .inkWell(onTap: () => monitoringPvr.singleUserData());
                }
              }));
    });
  }
}
