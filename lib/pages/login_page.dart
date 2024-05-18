import 'package:flutter/material.dart';
import 'package:geceden_app/views/button/button.dart';
import 'package:geceden_app/views/form_fields/phone_field.dart';
import 'package:geceden_app/views/logo/logo.dart';
import 'package:geceden_app/views/style/app_box_decoration.dart';
import 'package:geceden_app/views/style/app_colors.dart';
import 'package:geceden_app/views/style/app_text_styles.dart';

class LoginPage extends StatelessWidget {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  LoginPage({super.key});

  Future<void> onPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      // _phoneController'dan gelen telefon numarasına OTP kodu gonderilecek.
      // bir sonraki sayfaya yani dogrulama sayfasına gecis yapacak.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
            SizedBox(height: 50),
            AppLogo.appText,
            SizedBox(height: 50),
            SizedBox(
              width: 350,
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 40),
                decoration: AppBoxDecorationStyles.formFieldBoxDecoration,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 25, bottom: 10),
                            child: Text(
                              "Telefon Numarası",
                              style: AppTextStyles.buttonText,
                            ), 
                          )
                        ],
                      ),
                      PhoneField(controller: _phoneController),
                    ],
                  )
                ),
              ),
            ),
            // Butonlar
            const SizedBox(height: 50),
            AppButtonType(onPressed: onPressed, buttonText: "Doğrula",)
          ],
        ),
        ) 
      ),
    );
  }
}