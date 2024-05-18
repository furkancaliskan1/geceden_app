import 'package:flutter/material.dart';
import 'package:geceden_app/views/style/app_colors.dart';
import 'package:geceden_app/views/style/app_outline_input_border.dart.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneField extends StatefulWidget {

  final TextEditingController controller;

  const PhoneField({
    super.key,
    required this.controller,
  });

  @override
  State <PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State <PhoneField> {

  String country = 'TR';

  String? validatePhone(PhoneNumber? value){

    final regex = RegExp(r'^[+][(]{0,1}[0-9]{1,4}[)]{0,1}[-\s./0-9]$');

    if (value == null || value.number.isEmpty) {
      return '* Bu alan boş bırakılamaz';
    }
    if (!regex.hasMatch(value.number)) {
      return '* Lütfen geçerli bir numara giriniz';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: IntlPhoneField(
        invalidNumberMessage: '* Lütfen geçerli bir numara giriniz',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialCountryCode: 'TR',
        onCountryChanged: (value){
          country = value.toString();
        },
        validator: validatePhone,
        controller: widget.controller,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          counterText: '',
          labelText: '',
          filled: true,
          fillColor: AppColors.inputBackgroundColor,
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