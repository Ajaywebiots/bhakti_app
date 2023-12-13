import '../../../../config.dart';

class MonitoringSingleUserLayout extends StatelessWidget {
  const MonitoringSingleUserLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(children: [
      MonitoringSleepLayout(),
      MonitoringChantingLayout(),
      MonitoringWorshipLayout(),
      MonitoringKnowledgeLayout()
    ]));
  }
}
