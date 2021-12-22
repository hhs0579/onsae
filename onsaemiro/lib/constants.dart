import 'package:flutter/material.dart';

final int kStarConsumed = 10;
final int kMyVersion = 17;
final int kMinimumVersionIfError = 9999;
final Duration kMinimumLoadingTime = Duration(milliseconds: 300);
const kDeepLink = 'https://thirty.page.link/29hQ';
String kAndroidStoreLink =
    'https://play.google.com/store/apps/details?id=com.flynnapps.thirty';
String kAppleStoreLink =
    'https://apps.apple.com/kr/app/%EC%8D%A8%ED%8B%B0/id1583189348';

const kPrimaryColor = Color(0xffFE2550);
const kSecondaryColor = Color(0xff797979);

const kBlackColor = Color(0xff555555);
const kGreyColor = Color(0xffcccccc);
const kGreyLightColor = Color(0xffe2e2e2);
const kExtraLightGrey = Color(0xffF7F7F7);

const MaterialColor kPrimaryColorMaterial = MaterialColor(
  0xffFE2550,
  <int, Color>{
    50: Color(0xFFFFEBEE),
    100: Color(0xFFFFCDD2),
    200: Color(0xFFEF9A9A),
    300: Color(0xFFE57373),
    400: Color(0xFFEF5350),
    500: Color(0xffFE2550),
    600: Color(0xFFE53935),
    700: Color(0xFFD32F2F),
    800: Color(0xFFC62828),
    900: Color(0xFFB71C1C),
  },
);

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

const double kDefaultMargin = 25.0;
const double kDefaultPadding = 25.0;
