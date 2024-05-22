import 'package:app_geceden/screens/home_page.dart';
import 'package:app_geceden/screens/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('tr')
       ],
      title: 'Flutter Demo',
      theme: ThemeData( 
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
