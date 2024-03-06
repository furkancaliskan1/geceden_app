
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:geceden_app/views/form_fields.dart';
import 'package:geceden_app/views/geceden_icon.dart';
import 'package:geceden_app/views/geceden_styles.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({super.key});

  @override
  State <RegisterPage> createState() => _RegisterPageState(); 
}

class _RegisterPageState extends State <RegisterPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController customerName = TextEditingController();
  final TextEditingController customerSurname = TextEditingController();
  final TextEditingController customerBirthDate = TextEditingController();
  final TextEditingController customerGender = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GecedenColors.gecedenBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GecedenIcon.gecedenText,
                SizedBox(
                  width: 350,
                  child: Container(
                    padding: const EdgeInsets.only(top:30 ,bottom: 30),
                    decoration: GecedenBoxDecorationStyles.formFieldBoxDecoration,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //isim soyisim
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShortField(labelText: 'İsim', controller: customerName),
                              const SizedBox(width: 10),
                              ShortField(labelText: 'Soyisim', controller: customerSurname),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DateField(controller: customerBirthDate),
                              const SizedBox(width: 10),
                              DropDownMenu(controller: customerGender),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}