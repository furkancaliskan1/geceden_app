import 'package:app_geceden/assets/colors.dart';
import 'package:app_geceden/assets/outline_input_border.dart';
import 'package:app_geceden/utils/validate.dart';
import 'package:flutter/material.dart';


class NameField extends StatefulWidget {

  final TextEditingController controller;
  
  const NameField({
    super.key,
    required this.controller
    });

  @override
  State <NameField> createState() => _NameFieldState();
}

class  _NameFieldState extends State <NameField> {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextFormField(
        validator: Validate.name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        maxLines: 1,
        minLines: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.inputFieldBackgroundColor,
          contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 15,bottom: 15),
          errorBorder: AppOutlineInputBorder.errorBorder,
          focusedErrorBorder: AppOutlineInputBorder.errorBorder,
          enabledBorder: AppOutlineInputBorder.enabledBorder,
          focusedBorder: AppOutlineInputBorder.focusedBorder,
        ),
      ),
    );
  }
}