import '../config.dart';

class CommonBgImage extends StatelessWidget {
  final Widget? widget;

  const CommonBgImage({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(eImageAssets.splashBg)))),
      widget!
    ]);
  }
}
