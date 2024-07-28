import 'package:currency_converter/config/themes/app_style.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  static const normalWhite16 = TextStyle(color: Colors.white, fontSize: 16);
  static const normalBlack16 = TextStyle(color: Colors.black, fontSize: 16);
  static const smallPrimary14 =
      TextStyle(color: AppThemes.primaryColor, fontSize: 14);
  static const titleWhite18 = TextStyle(color: Colors.white, fontSize: 18);
  static const titleBlack18 = TextStyle(color: Colors.black, fontSize: 18);
  static const hintStyle = TextStyle(
      color: Colors.black45, fontSize: 12, fontWeight: FontWeight.w300);
  static const smallBlack12 =
      TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300);
  static const smallPrimary12 =
  TextStyle(color: AppThemes.primaryColor, fontSize: 12);
  static const smallWhite12 =
  TextStyle(color: AppThemes.whiteColor, fontSize: 12);
}
