import 'package:app_geceden/assets/colors.dart';
import 'package:app_geceden/assets/outline_input_border.dart';
import 'package:app_geceden/utils/validate.dart';
import 'package:flutter/material.dart';

class GenderField extends StatefulWidget {

  final TextEditingController controller;

  const GenderField({
    super.key,
    required this.controller,
  });

  @override
  State <GenderField> createState() => _GenderFieldState();
}

class _GenderFieldState extends State <GenderField> {

  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: DropdownButtonFormField(
        validator: Validate.gender,
        dropdownColor: const Color(0xff281c2c),
        value: dropdownValue,
        onChanged: (newValue) {
          setState(() {
            dropdownValue = newValue;
            widget.controller.text = dropdownValue.toString();
          });
        },
        items: const[
          DropdownMenuItem(value: 'Erkek', child: Text('Erkek')),
          DropdownMenuItem(value: 'Kadın', child: Text('Kadın')),
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.inputFieldBackgroundColor,
          contentPadding: const EdgeInsets.only(left: 10, right: 10 ,top: 15,bottom: 15),
          enabledBorder: AppOutlineInputBorder.enabledBorder,
          focusedBorder: AppOutlineInputBorder.focusedBorder,
          errorBorder: AppOutlineInputBorder.errorBorder,
          focusedErrorBorder: AppOutlineInputBorder.errorBorder,
        ),
      ),
    );
  }
}