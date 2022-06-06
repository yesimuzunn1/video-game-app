import 'package:flutter/material.dart';

const double defaultFontSize = 20.0;
const double defaultHeightSize = 1.0;
const defaultFontWeight = FontWeight.w400;

TextStyle boldTextStyle(color, {fontSize = defaultFontSize, height = defaultHeightSize, fontWeight = defaultFontWeight}) {
  return TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: color, height: height);
}

TextStyle mediumTextStyle(color, {fontSize = defaultFontSize, height = defaultHeightSize, fontWeight = defaultFontWeight}) {
  return TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: color, height: height);
}
