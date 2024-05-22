import 'package:app_geceden/assets/text_styles.dart';
import 'package:app_geceden/widgets/textfields/date_field.dart';
import 'package:app_geceden/widgets/textfields/gender_field.dart';
import 'package:app_geceden/widgets/textfields/name_field.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {

  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController birhDateController;
  final TextEditingController genderController;

  const RegisterForm({super.key, 
  required this.nameController, 
  required this.surnameController,
  required this.birhDateController,
  required this.genderController
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35, bottom: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "İsim",
                style: AppTextStyles.inputText,
              ),
              const SizedBox(width: 125),
              Text(
                "Soyisim",
                style: AppTextStyles.inputText,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            children: [
              NameField(controller: nameController),
              const SizedBox(width: 10),
              NameField(controller: surnameController)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, bottom: 7,top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Doğum Tarihi",
                style: AppTextStyles.inputText,
              ),
              const SizedBox(width: 60),
              Text(
                "Cinsiyet",
                style: AppTextStyles.inputText,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            children: [
              DateField(controller: birhDateController),
              const SizedBox(width: 10),
              GenderField(controller: genderController),
            ],
          ),
        ),
      ],
    );
  }
}
