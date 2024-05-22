import 'package:app_geceden/assets/box_decorations.dart';
import 'package:app_geceden/assets/text_styles.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  
  const AppIcon({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30,right: 30,top: 25,bottom: 25),
      margin: const EdgeInsets.only(top: 70,bottom: 50),
      decoration: AppBoxDecorations.gecedenIconBoxDecoration,
      child: Text(
        "G E C E D E N",
        style: AppTextStyles.iconTextStyle,
        ),
    );
  }
}

class AppIconUnbordered extends StatelessWidget {
  const AppIconUnbordered({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'GECEDEN',
      style: AppTextStyles.appBarIconTextStyle,
    );
  }
}