import 'dart:ui';
import 'package:flutter/material.dart';
import '../font_manager/font_manager.dart';

TextStyle _getTextStyle(
    {double? fontSize,
      String? fontFamily,
      Color? fontColor = Colors.black,
      FontWeight? fontWeight}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: fontColor,);
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s16, Color fontColor = Colors.black,FontWeight fontWeight=FontWeightManager.regular}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight:fontWeight,
      fontColor: fontColor);
}

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, Color fontColor = Colors.black}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.light,
      fontColor: fontColor);
}
TextStyle getBoldStyle({
  double fontSize = FontSize.s16,
  Color fontColor = Colors.black,
  fontFamily
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.bold,
    fontColor: fontColor,
  );
}

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, Color fontColor = Colors.black}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.semiBold,
      fontColor: fontColor);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, Color fontColor = Colors.black}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.medium,
      fontColor: fontColor);
}
