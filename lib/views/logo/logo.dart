import 'package:flutter/material.dart';
import 'package:geceden_app/views/style/app_box_decoration.dart';
import 'package:geceden_app/views/style/app_text_styles.dart';


class AppLogo {
  static Container appText = Container(
    padding: const EdgeInsets.all(25),
    margin: const EdgeInsets.all(50),
    decoration: AppBoxDecorationStyles.gecedenLogoBoxDecoration,
    child: Center(
      child: Text(
        'G E C E D E N',
        style: AppTextStyles.logoText,
      ),
    ),
  );
}