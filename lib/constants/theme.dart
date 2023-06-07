import 'package:flutter/material.dart';

const primaryColor = Color(0xff273343);
const greenColor = Color(0xFF2CB34A);
const whiteColor = Color.fromRGBO(255, 255, 255, 1);
const deepBlueColor = Color(0xff2f80ed);
const lightBlueColor = Color(0xff00c3ff);
const redColor = Color(0xfff2683c);

Map<int, Color> generateShades(Color primaryColor) {
  const int minShade = 50;
  const int maxShade = 900;
  const int step = 100;
  final Map<int, Color> shades = {};

  for (int shade = minShade; shade <= maxShade; shade += step) {
    final int shadeValue = primaryColor.value + shade * 1000000;
    shades[shade] = Color(shadeValue);
  }

  return shades;
}

final primaryMaterialColor =
    MaterialColor(primaryColor.value, generateShades(primaryColor));
