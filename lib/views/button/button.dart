import 'package:flutter/material.dart';
import 'package:geceden_app/views/style/app_colors.dart';
import 'package:geceden_app/views/style/app_text_styles.dart';

class AppButtonType extends StatefulWidget {

  final Function() onPressed;
  final String buttonText;

  const AppButtonType({super.key, required this.onPressed,required this.buttonText});

  State<AppButtonType> createState() => _AppButtonTypeState();
}

class _AppButtonTypeState extends State<AppButtonType> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(58, 52, 65, 0.69),
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 50, right: 50),
        side: BorderSide(
          color: AppColors.buttonBorderColor,
        )
      ),
      child: Text(
        widget.buttonText,
        style: AppTextStyles.buttonText,
      )
    );
  }
}