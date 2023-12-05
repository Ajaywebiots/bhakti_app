import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config.dart';

class CommonSocialContainer extends StatelessWidget {
  final String svgImage;
  const CommonSocialContainer({super.key, required this.svgImage});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: appColor(context)
                      .appTheme
                      .black
                      .withOpacity(.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4))
            ]),
        height: Sizes.s46,
        width: Sizes.s46,
        alignment: Alignment.center,
        child: SvgPicture.asset(svgImage));
  }
}
