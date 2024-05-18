import 'package:flutter/material.dart';
import 'package:geceden_app/views/style/app_colors.dart';

class AppTextStyles {

  static TextStyle logoText = TextStyle(
    fontFamily: 'Staatliches',
    fontSize: 35,
    color: AppColors.buttonBorderColor,
    fontWeight: FontWeight.w700,
    letterSpacing: -1,
  );

  static TextStyle buttonText = TextStyle(
    fontFamily: 'Staatliches',
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static TextStyle registerText = const TextStyle(
    fontFamily: 'Staatliches',
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

}