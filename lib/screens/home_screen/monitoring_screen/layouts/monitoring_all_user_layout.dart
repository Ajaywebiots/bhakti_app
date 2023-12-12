import '../../../../config.dart';

class MonitoringAllUserLayout extends StatelessWidget {
  const MonitoringAllUserLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MonitoringProvider>(
        builder: (context1, monitoringPvr, child) {
      return Column(children: [
        Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 16,
                      offset: Offset(0, 2))
                ]),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: monitoringPvr.userToDo.length,
                itemBuilder: (context, index) {
                  return CommonPopInkwell(
                      text: monitoringPvr.userToDo[index],
                      onTap: () => monitoringPvr.selectedCategory(index),
                      index: index,
                      selectedIndex: monitoringPvr.isSelected);
                })),
        const VSpace(Insets.i15),
        Container(
            child: monitoringPvr.isSelected == 0
                ? const SleepLayouts()
                : monitoringPvr.isSelected == 1
                    ? const ChantingLayouts()
                    : monitoringPvr.isSelected == 2
                        ? const WorshipGroupLayout()
                        : monitoringPvr.isSelected == 3
                            ? const PrasadamGroupLayout()
                            : const KnowledgeGroupLayout())
      ]);
    });
  }
}
