import 'package:app_geceden/assets/colors.dart';
import 'package:flutter/material.dart';

class AppOutlineInputBorder {
  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide:const BorderSide(color: Colors.red),
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