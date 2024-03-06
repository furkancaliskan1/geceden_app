
import 'package:flutter/material.dart';
import 'package:geceden_app/views/buttons.dart';
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

  final TextEditingController _customerName = TextEditingController();
  final TextEditingController _customerSurname = TextEditingController();
  final TextEditingController _customerBirthDate = TextEditingController();
  final TextEditingController _customerGender = TextEditingController();
  final TextEditingController _customerPhone = TextEditingController();
  final TextEditingController _customerEmail = TextEditingController();
  final TextEditingController _customerPassword = TextEditingController();

  void registerUserIn(){}

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
                              ShortField(labelText: 'İsim', controller: _customerName),
                              const SizedBox(width: 10),
                              ShortField(labelText: 'Soyisim', controller: _customerSurname),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DateField(controller: _customerBirthDate),
                              const SizedBox(width: 10),
                              DropDownMenu(controller: _customerGender),
                            ],
                          ),
                          const SizedBox(height: 10),
                          PhoneField(controller: _customerPhone),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: GecedenColors.iconColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            EMailField(eMailController: _customerEmail),
                            const SizedBox(height: 10),
                            PasswdField(passwdController: _customerPassword, isSignUp: false),
                          ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                GecedenButtonStyle(
                  onTap: registerUserIn,
                  paddingAll: 10,
                  marginHorizontal: 100,
                  buttonText: 'KAYIT OL',
                  borderColor: GecedenColors.buttonBlueBorderColor,
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}