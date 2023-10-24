import 'package:flutter/material.dart';

enum ThemeType {
  light,
  dark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  //Theme Colors
  bool isDark;
  Color primary;
  Color darkText;
  Color lightText;
  Color oneText;
  Color twoText;
  Color threeText;
  Color whiteBg;
  Color stroke;
  Color fieldCardBg;
  Color trans;
  Color black;
  Color containerClr;
  Color shadowClr;
  Color green;
  Color online;
  Color red;
  Color whiteColor;

  /// Default constructor
  AppTheme({
    required this.isDark,
    required this.primary,
    required this.darkText,
    required this.lightText,
    required this.oneText,
    required this.twoText,
    required this.threeText,
    required this.whiteBg,
    required this.stroke,
    required this.fieldCardBg,
    required this.trans,
    required this.black,
    required this.containerClr,
    required this.shadowClr,
    required this.online,
    required this.red,
    required this.green,
    required this.whiteColor,
  });

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
            isDark: false,
            primary: const Color(0xff541F5C),
            darkText: const Color(0xff00162E),
            lightText: const Color(0xff767676),
            oneText: const Color(0xff2D2D2D),
            twoText: const Color(0xff3d3d3d),
            threeText: const Color(0xff868686),
            whiteBg: const Color(0xffFFFFFF),
            stroke: const Color(0xffE5E8EA),
            fieldCardBg: const Color(0xffF5F6F7),
            whiteColor: const Color(0xffFFFFFF),
            trans: Colors.transparent,
            black: const Color(0xff000000),
            containerClr: const Color(0xffEEE9EF),
            shadowClr: const Color(0x1E929292),
            green: Colors.green,
            online: Colors.green,
            red: const Color(0xffFF4B4B));

      case ThemeType.dark:
        return AppTheme(
            isDark: true,
            primary: const Color(0xff5465FF),
            darkText: const Color(0xffF1F1F1),
            lightText: const Color(0xff767676),
            oneText: const Color(0xff808B97),
            twoText: const Color(0xff3d3d3d),
            threeText: const Color(0xff3d3d3d),
            whiteBg: const Color(0xff1A1C28),
            stroke: const Color(0xff3A3D48),
            fieldCardBg: const Color(0xff262935),
            whiteColor: const Color(0xffFFFFFF),
            trans: Colors.transparent,
            black: const Color(0xff000000),
            containerClr: const Color(0xffEEE9EF),
            shadowClr: const Color(0x1E929292),
            green: Colors.green,
            online: Colors.green,
            red: const Color(0xffFF4B4B));
    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        secondary: primary,
        background: whiteBg,
        surface: whiteBg,
        onBackground: whiteBg,
        onSurface: whiteBg,
        onError: Colors.red,
        onPrimary: primary,
        tertiary: whiteBg,
        onInverseSurface: whiteBg,
        tertiaryContainer: whiteBg,
        surfaceTint: whiteBg,
        surfaceVariant: whiteBg,
        onSecondary: primary,
        error: Colors.red,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.transparent, cursorColor: primary),
      buttonTheme: ButtonThemeData(buttonColor: primary),
      highlightColor: primary,
    );
  }
}
