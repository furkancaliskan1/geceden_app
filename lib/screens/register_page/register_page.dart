// ignore_for_file: use_build_context_synchronously

import 'package:app_geceden/assets/box_decorations.dart';
import 'package:app_geceden/assets/colors.dart';
import 'package:app_geceden/assets/text_styles.dart';
import 'package:app_geceden/firebase/services/firestore_service.dart';
import 'package:app_geceden/screens/home_page.dart';
import 'package:app_geceden/screens/register_page/register_form.dart';
import 'package:app_geceden/widgets/button.dart';
import 'package:app_geceden/widgets/icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirestoreService _firestoreService = FirestoreService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  void onPressed () async {
    if (_formKey.currentState?.validate() ?? false){
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) { // giriş yapabilmiş ise    
        try {
          _firestoreService.addUser(
            user,
            _nameController.text, 
            _surnameController.text, 
            _birthDateController.text,
            _genderController.text
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
              "Kayıt işlemi başarısız",
              style: AppTextStyles.inputText,
            ),
            backgroundColor: Colors.red.shade300,
            )
          );
        }
        showDialog(
          context: context,
          builder: (context) => const Center(child: CircularProgressIndicator())
        );
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Formu doğru doldurduğunuzdan emin olunuz",
            style: AppTextStyles.inputText,
          ),
          backgroundColor: Colors.red.shade300,
        )
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppIcon(),
                const SizedBox(height: 50),
                SizedBox(
                  height: 300,
                  width: 360,
                  child: Container(
                    decoration: AppBoxDecorations.formFieldBoxDecoration,
                    child: Form(
                      key: _formKey,
                      child: RegisterForm(
                        nameController: _nameController, 
                        surnameController: _surnameController,
                        birhDateController: _birthDateController,
                        genderController: _genderController,
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                AppButton(
                  text: "Kayıt Ol", 
                  onPressed: onPressed, 
                  controller: _nameController
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}