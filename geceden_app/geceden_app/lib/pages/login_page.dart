import 'package:flutter/material.dart';
import 'package:geceden_app/views/buttons.dart';
import 'package:geceden_app/views/form_fields.dart';
import 'package:geceden_app/views/geceden_icon.dart';
import 'package:geceden_app/views/geceden_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State <LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State <LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //form işlemlerini kontrol etmek için oluşturulan değişken

  // Verilerin tutulduğu değişkenler
  final TextEditingController _eMailController = TextEditingController(); //E-Mail bilgileri.
  final TextEditingController _passwdController = TextEditingController(); // Şifre Bilgileri.

  //giriş yap butonuna tıklanıldığında
  Future<void> signUserIn() async {
    if (_formKey.currentState?.validate() ?? false) {
      // validate işlemi başarılıysa yani form düzgün bir şekilde doldurulduysa
      _formKey.currentState?.save();
      // database bağlantı ve veri eşleşmesi var mı yok mu kontrolü. _eMailController = E mail bilgisini , _passwdController = Şifre bilgisini tutuyor.
      // eğer database bağlantısında bir problem yoksa ve eşleşme varsa login yapabilsin.
      // diğer durumlarda Hata mesajı döndürülsün
    }
    // diğer durumlarda Hata mesajı döndürülsün
    else {
    }
  }


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
                //form field
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
                          EMailField(eMailController: _eMailController),
                          const SizedBox(height: 30),
                          PasswdField(passwdController: _passwdController,isSignUp: true),
                        ],
                      )
                    ),
                  ),
                ),
                //butonlar
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: StringButtonStyle(text: 'Şifremi Unuttum', onTap: (){}),
                      )
                  ],
                ),
                const SizedBox(height: 30),
                GecedenButtonStyle(
                  onTap: signUserIn,
                  paddingAll: 10,
                  marginHorizontal: 100,
                  buttonText: 'GİRİŞ YAP',
                  borderColor: GecedenColors.buttonBlueBorderColor,
                ),
                const SizedBox(height: 10),
                Text(
                 'Hala aramıza katılmadın mı ?',
                  style: TextStyle(color: GecedenColors.iconColor),
                ),
                const SizedBox(height: 5),     
                StringButtonStyle(text: 'Kayıt Ol', onTap: () { /* register page yönlendirilir. */}),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children : [
                    ImageButtonStyle(path: 'lib/images/apple.png', onTap: (){}),
                    const SizedBox(width: 70),
                    ImageButtonStyle(path: 'lib/images/google.png', onTap: (){})
                  ]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}