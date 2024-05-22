import 'package:app_geceden/assets/colors.dart';
import 'package:app_geceden/assets/outline_input_border.dart';
import 'package:app_geceden/utils/validate.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';


// ignore: must_be_immutable
class PhoneField extends StatefulWidget {

  final TextEditingController controller;
  final ValueChanged<PhoneNumber> onChanged;

  const PhoneField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  
  @override
  State <PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State <PhoneField> {

  String country = 'TR';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: IntlPhoneField(
        invalidNumberMessage: '* Lütfen geçerli bir numara giriniz',
        initialCountryCode: 'TR',
        onCountryChanged: (value){
          country = value.dialCode;
        },
        onChanged: (value) {
          widget.controller.text = value.completeNumber;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: Validate.phone,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          counterText: '',
          labelText: '',
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