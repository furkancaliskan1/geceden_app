import 'package:app_geceden/assets/colors.dart';
import 'package:flutter/material.dart';

class AppBoxDecorations {
  static BoxDecoration formFieldBoxDecoration = BoxDecoration(
    color: AppColors.formFieldBackGroundColor,
    border: Border.all(
      color: AppColors.formFieldBackGroundColor,
      width: 1.0
    ),
    borderRadius: BorderRadius.circular(15)
  );
  
  static BoxDecoration gecedenIconBoxDecoration = BoxDecoration(
      border: Border.all(
        color: AppColors.buttonBorderColor,
        width: 1.0,
      ),
    );
}

