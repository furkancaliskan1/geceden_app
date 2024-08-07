import 'package:app_geceden/assets/colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {

  static TextStyle iconTextStyle = TextStyle(
    fontFamily: 'Staatliches',
    fontSize: 35,
    color: AppColors.buttonBorderColor,
    fontWeight: FontWeight.w700,
    letterSpacing: -1,
  );

  static TextStyle inputText = const TextStyle(
    fontFamily: 'Staatliches',
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle appBarIconTextStyle = const TextStyle(
    fontFamily: 'Staatliches',
    fontSize: 24,
    height: 2.0,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    letterSpacing: 3,
  );
}
