import '../../../../config.dart';

class AddUserSearchLayout extends StatelessWidget {
  final Map<String, dynamic>? data;
  final int? dataInt;

  const AddUserSearchLayout({super.key, this.dataInt, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SettingListLayouts(
          image: data!['image'],
          index: dataInt,
          isShare: true,
          widget: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: appColor(context).appTheme.shadowClr,
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                        spreadRadius: 0)
                  ],
                  color: appColor(context).appTheme.whiteColor),
              width: 34,
              height: 35,
              child: SvgPicture.asset(eSvgAssets.add)),
          list: appArray.searchList,
          text: data!['name'])
    ]);
  }
}
