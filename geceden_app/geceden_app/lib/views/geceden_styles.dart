import 'package:flutter/material.dart';

class GecedenColors {
  static Color gecedenBackgroundColor =  const Color(0xff28282c);
  static Color formFieldBackGroundColor =  const Color.fromRGBO(85, 65, 95, 0.15);
  static Color formFieldBorderColor = const Color.fromRGBO(255, 255, 255, 0.15);
  static Color buttonBlueBorderColor = const Color.fromRGBO(182, 198, 255, 0.7);
  static Color buttonGreyBorderColor = const Color.fromRGBO(255, 255, 255, 0.7);
  static Color iconColor = const Color.fromRGBO(255, 255, 255, 0.3);
  static Color textFieldBackgroundColor = const Color.fromRGBO(51, 53, 58, 0.6);
}

class GecedenTextStyles {
  static TextStyle iconTextStyle = TextStyle(
    fontFamily: 'Staatliches',
    fontSize: 35,
    color: GecedenColors.buttonGreyBorderColor,
    fontWeight: FontWeight.w700,
    letterSpacing: -1,
  );

  static TextStyle buttonText = const TextStyle(
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

class GecedenBoxDecorationStyles {
  static BoxDecoration formFieldBoxDecoration = BoxDecoration(
    color: GecedenColors.formFieldBackGroundColor,
    border: Border.all(
      color : GecedenColors.formFieldBackGroundColor,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(15),
  );

  static BoxDecoration gecedenIconBoxDecoration = BoxDecoration(
      border: Border.all(
        color: GecedenColors.buttonGreyBorderColor,
        width: 1.0,
      ),
    );
}

class GecedenOutlineInputBorder {
  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide:const BorderSide(color: Colors.red),
  );

  static OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderSide: BorderSide(color: GecedenColors.formFieldBackGroundColor),
    borderRadius: BorderRadius.circular(15),
  );

  static OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(color : Colors.white),
    borderRadius: BorderRadius.circular(15),
  );
}

