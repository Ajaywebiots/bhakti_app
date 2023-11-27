import 'package:bhakti_app/common/extension/text_style_extensions.dart';
import 'package:bhakti_app/config.dart';
import 'package:bhakti_app/providers/monitoring_provider.dart';

class KnowledgeGroupLayout extends StatelessWidget {
  const KnowledgeGroupLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MonitoringProvider>(builder: (context, monitoringPvr, child) {
      return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: DataTable(
                  columnSpacing: 60,
                  dataRowMinHeight: 0,
                  dataRowMaxHeight: 51,
                  headingTextStyle: appCss.dmDenseSemiBold16
                      .textColor(
                      appColor(context).appTheme.primary),
                  dataTextStyle: appCss.dmDenseMedium14.textColor(
                      appColor(context).appTheme.lightText),
                  headingRowColor: MaterialStateColor.resolveWith(
                          (states) =>
                      appColor(context).appTheme.containColor),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)),
                  columns: monitoringPvr.knowledgeDataColumn(),
                  rows: List<DataRow>.generate(
                      monitoringPvr.knowledgeDataRow().length, (index) {
                    Color rowColor = index % 2 == 0
                        ? appColor(context).appTheme.whiteColor
                        : appColor(context).appTheme.containerClr1;
                    return DataRow(
                        color: MaterialStateColor.resolveWith(
                                (states) => rowColor),
                        cells: monitoringPvr
                            .knowledgeDataRow()[index]
                            .cells);
                  }))));
    },);
  }
}
