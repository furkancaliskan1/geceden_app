import 'package:app_geceden/assets/colors.dart';
import 'package:app_geceden/assets/outline_input_border.dart';
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
        initialCountryCode: 'TR',
        onCountryChanged: (value){
          country = value.dialCode;
        },
        onChanged: (value) {
          widget.controller.text = value.completeNumber;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validatePhone,
        //controller: widget.controller,
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