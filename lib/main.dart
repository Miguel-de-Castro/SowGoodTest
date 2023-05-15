import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sow_good/views/screens/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Widget home;
    if (const String.fromEnvironment('USER_TYPE') == 'PATIENT') {
      home = const LoginPage(); // Define a página LoginPage como home
    } else {
      if(const String.fromEnvironment('USER_TYPE') == null){
        home =  const Text('Variavel user type nula.');
      }
      home = Scaffold(
        appBar: AppBar(
          title: const Text('MyApp'),
        ),
        body: const Center(
          child: Text('Hello, world!'),
        ),
      );
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: home, // Utiliza a variável "home" como a página de início
    );
  }
}