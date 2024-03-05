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
                const SizedBox(height: 50),
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
                Text(
                  'Kayıt Ol',
                  style : GecedenTextStyles.registerText,
                  ),
                const SizedBox(height: 30),
                // Çizgi eklenebilr.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children : [
                    Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: GecedenColors.iconColor,
                        width: 1.0
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                      child : Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child : IconButton(
                          onPressed: () {
                            
                          },
                          icon:const Icon(Icons.apple, color: Colors.white, size: 70),
                        )
                      ),
                    ),
                    const SizedBox(width: 70),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: GecedenColors.iconColor,
                          width: 1.0
                       ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(
                        "lib/images/google.png",
                        width: 50,
                        height: 50,
                        ),
                      )
                    )
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