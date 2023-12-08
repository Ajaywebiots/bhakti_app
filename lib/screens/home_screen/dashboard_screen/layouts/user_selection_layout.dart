import '../../../../config.dart';

class UserSelectionLayout extends StatelessWidget {
  final bool? isSelected;
  final int? index;

  const UserSelectionLayout({this.isSelected, super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dashboardPvr, child) {
        return Container(
                margin: const EdgeInsets.only(right: 15),
                child: Column(children: [
                  Opacity(
                      opacity: isSelected! ? 1.0 : 0.8,
                      child: Image.asset(
                          height: isSelected! ? Sizes.s50 : Sizes.s43,
                          width: isSelected! ? Sizes.s50 : Sizes.s43,
                          "assets/images/userSection.png")),
                  if (isSelected!) Text(dashboardPvr.names[index!])
                ]))
            .inkWell(
                onTap: () => dashboardPvr.onUserSelection(isSelected, index));
      },
    );
  }
}
