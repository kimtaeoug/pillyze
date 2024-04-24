import 'package:flutter/material.dart';
import 'package:pillyze/app/config/colors.dart';

extension Styler on TextStyle {
  static TextStyle style({
    double fontSize = 12,
    Color color = PColors.gray,
    FontWeight fontWeight = FontWeight.w500,
    double height = 1.68,
  }) =>
      TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          height: height,
          fontFamily: 'pretendard');
}
