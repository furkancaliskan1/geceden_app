import 'package:app_geceden/assets/colors.dart';
import 'package:app_geceden/assets/outline_input_border.dart';
import 'package:flutter/material.dart';


class DateField extends StatefulWidget {

  final TextEditingController controller;

  const DateField({
    super.key,
    required this.controller,
    });

  @override
  State <DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State <DateField> {

  bool isGreaterThan18 = true;

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker( // 20-10-15
      context: context,
      locale: const Locale('tr','TR'),
      initialDate: DateTime.now(), 
      firstDate: DateTime(1960), 
      lastDate: DateTime.now(),
      );
      
      if (picked != null) {
        DateTime currentDate = DateTime.now();
        setState(() {
          widget.controller.text = picked.toString().split(" ")[0];
        });

        if (currentDate.difference(picked).inDays ~/ 365 >= 18) {
          isGreaterThan18 = true;
        }else{
          isGreaterThan18 = false;
      }
    }
  }

  String? validateDate(String? value)
  {
    if (value == null || value.isEmpty) {
      return '* Bu alan boş bırakılamaz';
    }
    if (!isGreaterThan18) {
      return '* Yaşınız 18 den büyük olmalı.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextFormField(
        validator: validateDate,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.inputFieldBackgroundColor,
          prefixIcon: Icon(Icons.calendar_today, color: AppColors.iconColor),
          contentPadding: const EdgeInsets.only(left: 10, right: 10 ,top: 15,bottom: 15),
          enabledBorder: AppOutlineInputBorder.enabledBorder,
          focusedBorder: AppOutlineInputBorder.focusedBorder,
          errorBorder: AppOutlineInputBorder.errorBorder,
          focusedErrorBorder: AppOutlineInputBorder.errorBorder,
        ),
        onTap: _selectDate,
      ),
    );
  }
}
