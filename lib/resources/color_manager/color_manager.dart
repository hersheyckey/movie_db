import 'package:flutter/material.dart';

class ColorManager {
  static Color lightBlue = HexColor.fromHex("#61C3F2");
  static Color primaryColor = HexColor.fromHex("#2E2739");
  static Color lightGreyShadeBackgroundColor = HexColor.fromHex("#F6F6FA");
  static Color lightGrey = HexColor.fromHex("#DBDBDF");
  static Color greyColor = HexColor.fromHex("#827D88");
  static Color green = HexColor.fromHex("#15D2BC");
  static Color pink = HexColor.fromHex("#E26CA5");
  static Color purple = HexColor.fromHex("#564CA3");
  static Color yellow = HexColor.fromHex("#CD9D0F");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black= HexColor.fromHex("#000000");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");

    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}
