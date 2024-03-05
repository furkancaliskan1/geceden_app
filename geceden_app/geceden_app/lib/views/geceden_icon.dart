import 'package:flutter/material.dart';
import 'package:geceden_app/views/geceden_styles.dart';

class GecedenIcon {
  static Container gecedenText = Container(
    padding: const EdgeInsets.all(25),
    margin: const EdgeInsets.all(50),
    decoration: GecedenBoxDecorationStyles.gecedenIconBoxDecoration,
    child: Center(
      child: Text(
        'G E C E D E N',
        style: GecedenTextStyles.iconTextStyle,
      ),
    ),
  );
}