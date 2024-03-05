import 'package:flutter/material.dart';
import 'package:geceden_app/views/geceden_styles.dart';
import 'package:flutter/services.dart';

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
      return '*E-Posta alanı boş bırakılamaz';
    }
    if (!regex.hasMatch(value)) {
      return '*Lütfen geçerli bir e-posta adresi girin';
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: GecedenColors.formFieldBackGroundColor),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color : Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: TextFormField(
        controller: widget.passwdController,
        autocorrect: false,
        obscureText: true,
        maxLines: 1,
        minLines: 1,
        decoration: InputDecoration(
          labelText: 'Şifre',
          prefixIcon: Icon(Icons.lock ,color: GecedenColors.iconColor),
          filled: true,
          fillColor: GecedenColors.textFieldBackgroundColor,
          contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 15,bottom: 15),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: GecedenColors.formFieldBackGroundColor),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color : Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
