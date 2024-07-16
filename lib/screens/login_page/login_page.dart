// ignore_for_file: use_build_context_synchronously

import 'package:app_geceden/assets/box_decorations.dart';
import 'package:app_geceden/assets/colors.dart';
import 'package:app_geceden/assets/text_styles.dart';
import 'package:app_geceden/firebase/services/auth_service.dart';
import 'package:app_geceden/screens/home_page/home_page.dart';
import 'package:app_geceden/screens/register_page/register_page.dart';
import 'package:app_geceden/widgets/button.dart';
import 'package:app_geceden/widgets/icon.dart';
import 'package:app_geceden/screens/login_page/otp_form.dart';
import 'package:app_geceden/widgets/textfields/phone_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _otpKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String countryCode = '';

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  // doğrula butonuna basıldığında
  void verifyOnPressed() {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    if (_formKey.currentState?.validate() ?? false) {
      // phone alanı düzgün bir şekilde doldurulduysa
      AuthService.sendOTP(
        phoneController: countryCode + _phoneController.text,
        errorStep: errorStep,
        nextStep: nextStep,
      );
    }
  }

  // Kod göndermede hata varsa
  void errorStep() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "SMS Gönderilemiyor",
        style: AppTextStyles.inputText,
      ),
      backgroundColor: Colors.red.shade300,
    ));
  }

  //Eğer kod gönderilirse
  void nextStep() {
    Navigator.pop(context);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
              decoration: BoxDecoration(
                color: AppColors.appBackgroundColor,
                border: Border.all(
                    width: 1.0, color: AppColors.formFieldBackGroundColor),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone_iphone,
                    color: AppColors.buttonBorderColor,
                    size: 64,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Telefonunuzu Doğrulayın",
                    style: TextStyle(
                      fontFamily: 'Staatliches',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    child: Text(
                      textAlign: TextAlign.center,
                      "${countryCode + _phoneController.text} \nnumarasına göndermiş olduğumuz \nkodu giriniz",
                      style: const TextStyle(
                        fontFamily: 'Staatliches',
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: _otpKey,
                    child: OtpForm(otpController: _otpController),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Kod elinize ulaşmadı mı?',
                        style: TextStyle(
                          fontFamily: 'Staatliches',
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            AuthService.sendOTP(
                                phoneController: _phoneController.text,
                                errorStep: errorStep,
                                nextStep: () {});
                          },
                          child: const Text(
                            'Tekrar Gönder',
                            style: TextStyle(
                              fontFamily: 'Staatliches',
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 40),
                  AppButton(
                    text: "Onayla",
                    controller: _otpController,
                    onPressed: acceptOnPressed,
                  )
                ],
              )),
        );
      },
    );
  }

  // Onayla butonuna basıldığında
  void acceptOnPressed() {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    if (_otpKey.currentState?.validate() ?? false) {
      AuthService.loginWithOtp(
              otp: _otpController.text, phoneController: _phoneController.text)
          .then((value) {
        if (value == 'register_page') {
          Navigator.popUntil(context, ModalRoute.withName('/'));
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterPage()));
        } else if (value == 'home_page') {
          Navigator.popUntil(context, ModalRoute.withName('/'));
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          Navigator.pop(context);
          Navigator.pop(context);
          _otpController.clear();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Doğrulama kodu yanlış, tekrar deneyin",
              style: AppTextStyles.inputText,
            ),
            backgroundColor: Colors.red.shade300,
          ));
        }
      });
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
                height: 175,
                width: 350,
                child: Container(
                  padding: const EdgeInsets.only(top: 30),
                  decoration: AppBoxDecorations.formFieldBoxDecoration,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30, bottom: 15),
                            child: Text(
                              "Telefon Numarası",
                              style: AppTextStyles.inputText,
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: _formKey,
                        child: PhoneField(
                          controller: _phoneController,
                          onChanged: (value) {
                            countryCode = value.countryCode;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              AppButton(
                controller: _phoneController,
                text: "Doğrula",
                onPressed: verifyOnPressed,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
