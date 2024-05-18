
import 'package:app_geceden/assets/colors.dart';
import 'package:app_geceden/assets/text_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String text;
  final Function()? onPressed;
  final TextEditingController controller;

  const AppButton({
    super.key, 
    required this.text, 
    required this.onPressed,
    required this.controller
    });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {

  bool isControllerNotEmpty = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateControllerState);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateControllerState);
    super.dispose();
  }

  void _updateControllerState() {
    setState(() {
      isControllerNotEmpty = widget.controller.text.isNotEmpty;
    });
  }


  @override
  Widget build(BuildContext context) {

    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: AppTextStyles.inputText,
      backgroundColor: const Color.fromRGBO(85, 65, 95, 0.35),
      foregroundColor: AppColors.buttonBorderColor,
      padding: const EdgeInsets.only(left: 60, right: 60),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: AppColors.buttonBorderColor,
            width: 0.2,
          )
        ),
      );

    return ElevatedButton(
      style: style,
      onPressed: isControllerNotEmpty ? widget.onPressed : null,
      child: Text(widget.text),
    );
  }
}