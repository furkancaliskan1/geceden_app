import 'package:flutter/material.dart';
import 'package:geceden_app/views/style/app_colors.dart';

class AppBoxDecorationStyles {
  
  static BoxDecoration formFieldBoxDecoration = BoxDecoration(
    color: AppColors.formFieldBackGroundColor,
    border: Border.all(
      color : AppColors.formFieldBackGroundColor,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(15),
  );

  static BoxDecoration gecedenLogoBoxDecoration = BoxDecoration(
      border: Border.all(
        color: AppColors.buttonBorderColor,
        width: 1.0,
      ),
    );
}