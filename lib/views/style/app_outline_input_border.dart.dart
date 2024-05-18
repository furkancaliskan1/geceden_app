import 'package:flutter/material.dart';
import 'package:geceden_app/views/style/app_colors.dart';

class AppOutlineInputBorder {

  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Colors.red),
  );

  static OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.formFieldBackGroundColor),
    borderRadius: BorderRadius.circular(15),
  );

  static OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(color : Colors.white),
    borderRadius: BorderRadius.circular(15),
  );

}