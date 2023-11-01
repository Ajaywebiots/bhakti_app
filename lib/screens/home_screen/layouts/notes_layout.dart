import 'package:bhakti_app/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bhakti_app/common/extension/text_style_extensions.dart';

class NotesLayout extends StatelessWidget {
  const NotesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, child) {
      return  Center(
          child: Container(
              height: Sizes.s119,
              decoration: BoxDecoration(
                  color:
                  appColor(context).appTheme.containerClr1,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: const Color(0xff541F5C)
                          .withOpacity(0.2),
                      width: 1)),
              child: Stack(children: [
                TextField(
                    decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.all(15),
                        hintText: 'Enter Text..',
                        hintStyle: appCss.dmDenseRegular14
                            .textColor(appColor(context)
                            .appTheme
                            .primary),
                        border: InputBorder.none),
                    keyboardType: TextInputType.multiline,
                    maxLines: 4),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 6, right: 6),
                        alignment: Alignment.center,
                        height: Sizes.s32,
                        width: Sizes.s35,
                        decoration: BoxDecoration(
                            color: appColor(context)
                                .appTheme
                                .primary,
                            borderRadius:
                            BorderRadius.circular(8)),
                        child: SvgPicture.asset(
                            "assets/svg/tick.svg")))
              ])));
    },);
  }
}
