import 'package:flutter/material.dart';
import 'package:geceden_app/views/geceden_styles.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class EMailField extends StatefulWidget {

  final TextEditingController eMailController;

  const EMailField({
    super.key,
    required this.eMailController,
    });

  @override
  State <EMailField> createState() => _EMailFieldState();
}

class _EMailFieldState extends State <EMailField> {
  
  //E-Mail bilgisi doğru girilmiş mi?
  //Regex'e uygun mu veya boş mu kontrolü eğer uygunsa null döndür değilse 'Geçerli bir e-posta adresi girin.'

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

    final regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return '* E-Posta alanı boş bırakılamaz';
    }
    if (!regex.hasMatch(value)) {
      return '* Lütfen geçerli bir e-posta adresi girin';
      }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: TextFormField(
        validator: validateEmail,
        keyboardType: TextInputType.emailAddress,
        controller: widget.eMailController,
        autocorrect: false,
        maxLines: 1,
        minLines: 1,
        decoration: InputDecoration(
          labelText: 'E-Posta',
          prefixIcon: Icon(Icons.person, color: GecedenColors.iconColor),
          filled: true,
          fillColor: GecedenColors.textFieldBackgroundColor,
          contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 15,bottom: 15),
          errorBorder: GecedenOutlineInputBorder.errorBorder,
          focusedErrorBorder: GecedenOutlineInputBorder.errorBorder,
          enabledBorder: GecedenOutlineInputBorder.enabledBorder,
          focusedBorder: GecedenOutlineInputBorder.focusedBorder,
        ),
      ),
    );
  }
}

class PasswdField extends StatefulWidget {

  final TextEditingController passwdController;
  final bool isSignUp;

  const PasswdField ({
    super.key,
    required this.passwdController,
    required this.isSignUp,
  });

  @override
  State <PasswdField> createState() => _PasswdFieldState();
}


class _PasswdFieldState extends State <PasswdField> {

  bool obscureValue = true;

  String? validatePassword(String? value)
  {
    String errorMessage = '';

    if (value == null || value.isEmpty) {
      return '* Şifre alanı boş bırakılamaz.';
    }
    if (!widget.isSignUp) {
      if (value.length < 6) {
        errorMessage += '* Şifrenin uzunluğu 6 karakter veya daha uzun olmalı.\n';
      }
      if (!value.contains(RegExp(r'[A-ZÇĞİÖŞÜ]'))) {
        errorMessage += '* Şifreniz en az bir büyük karakter içermeli.\n';
      }
      if (!value.contains(RegExp(r'[a-zçğıöşü]'))) {
        errorMessage += '* Şifreniz en az bir küçük karakter içermeli.\n';
      }
      if (!value.contains(RegExp(r'[0-9]'))) {
        errorMessage += '* Şifreniz en az bir rakam içermeli.\n';
      }
      if (!value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
        errorMessage += '* Şifreniz en az bir özel karakter içermeli.\n';
      }
      return errorMessage.isEmpty ? null : errorMessage;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: TextFormField(
        obscureText: obscureValue,
        validator: validatePassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.passwdController,
        autocorrect: false,
        maxLines: 1,
        minLines: 1,
        decoration: InputDecoration(
          labelText: 'Şifre',
          prefixIcon: Icon(Icons.lock, color: GecedenColors.iconColor),
          suffixIcon: IconButton(
          onPressed: () {
            setState(() {
                obscureValue = !obscureValue;
              });
        },
        icon: Icon(Icons.visibility, color: GecedenColors.iconColor),
        ),
        filled: true,
        fillColor: GecedenColors.textFieldBackgroundColor,
        contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        errorBorder: GecedenOutlineInputBorder.errorBorder,
        focusedErrorBorder: GecedenOutlineInputBorder.errorBorder,
        enabledBorder: GecedenOutlineInputBorder.enabledBorder,
        focusedBorder: GecedenOutlineInputBorder.focusedBorder,
        ),
      ),
    );
  }
}

class ShortField extends StatefulWidget {

  final String labelText;
  final TextEditingController controller;
  
  const ShortField({
    super.key,
    required this.labelText,
    required this.controller
    });

  @override
  State <ShortField> createState() => _ShortFieldState();
}

class  _ShortFieldState extends State <ShortField> {
  
  String? validatePersonal(String? value){

    final regex = RegExp(r'[^a-z A-ZçÇğĞıİöÖşŞüÜ]');
    
    if (value == null || value.isEmpty) {
      return '* Bu alan boş bırakılamaz';
    }
    if (regex.hasMatch(value)) {
      return '* Sadece harf giriniz';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextFormField(
        validator: validatePersonal,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        maxLines: 1,
        minLines: 1,
        decoration: InputDecoration(
          labelText: widget.labelText,
          filled: true,
          fillColor: GecedenColors.textFieldBackgroundColor,
          contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 15,bottom: 15),
          errorBorder: GecedenOutlineInputBorder.errorBorder,
          focusedErrorBorder: GecedenOutlineInputBorder.errorBorder,
          enabledBorder: GecedenOutlineInputBorder.enabledBorder,
          focusedBorder: GecedenOutlineInputBorder.focusedBorder,
        ),
      ),
    );
  }
}

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
    DateTime? _picked = await showDatePicker( // 20-10-15
      context: context,
      initialDate: DateTime.now(), 
      firstDate: DateTime(1960), 
      lastDate: DateTime.now()
      );
      
      if (_picked != null) {
        DateTime currentDate = DateTime.now();
        setState(() {
          widget.controller.text = _picked.toString().split(" ")[0];
        });

        if (currentDate.difference(_picked).inDays ~/ 365 >= 18) {
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
          labelText: 'Doğum Tarihi',
          filled: true,
          fillColor: GecedenColors.textFieldBackgroundColor,
          prefixIcon: Icon(Icons.calendar_today, color: GecedenColors.iconColor),
          contentPadding: const EdgeInsets.only(left: 10, right: 10 ,top: 15,bottom: 15),
          enabledBorder: GecedenOutlineInputBorder.enabledBorder,
          focusedBorder: GecedenOutlineInputBorder.focusedBorder,
          errorBorder: GecedenOutlineInputBorder.errorBorder,
          focusedErrorBorder: GecedenOutlineInputBorder.errorBorder,
        ),
        onTap: _selectDate,
      ),
    );
  }
}

class DropDownMenu extends StatefulWidget {

  final TextEditingController controller;

  const DropDownMenu({
    super.key,
    required this.controller,
  });

  @override
  State <DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State <DropDownMenu> {

  String? dropdownValue;

  String? validateGender(String? value)
  {
    if (value == null || value.isEmpty) {
      return '* Bu alan boş bırakılamaz';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: DropdownButtonFormField(
        validator: validateGender,
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
          DropdownMenuItem(value: 'Belirsiz', child: Text('Belirtmek\nİstemiyorum')),
        ],
        decoration: InputDecoration(
          labelText: 'Cinsiyet',
          filled: true,
          fillColor: GecedenColors.textFieldBackgroundColor,
          contentPadding: const EdgeInsets.only(left: 10, right: 10 ,top: 15,bottom: 15),
          enabledBorder: GecedenOutlineInputBorder.enabledBorder,
          focusedBorder: GecedenOutlineInputBorder.focusedBorder,
          errorBorder: GecedenOutlineInputBorder.errorBorder,
          focusedErrorBorder: GecedenOutlineInputBorder.errorBorder,
        ),
      ),
    );
  }
}

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
          labelText: 'Telefon Numarası',
          filled: true,
          fillColor: GecedenColors.textFieldBackgroundColor,
          contentPadding: const EdgeInsets.only(left: 10, right: 10 ,top: 15,bottom: 15),
          enabledBorder: GecedenOutlineInputBorder.enabledBorder,
          focusedBorder: GecedenOutlineInputBorder.focusedBorder,
          errorBorder: GecedenOutlineInputBorder.errorBorder,
          focusedErrorBorder: GecedenOutlineInputBorder.errorBorder,           
        ),
      ),
    );
  }
}