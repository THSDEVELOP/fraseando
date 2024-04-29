import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fraseando/pages/mainPage.dart';
import 'package:fraseando/pages/pageLogin.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp()); // Inicializa o aplicativo usando o widget MyApp
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: RouterTela(), // Define BoasVindas como a tela inicial
    );
  }
}

class RouterTela extends StatefulWidget {
  const RouterTela({super.key});

  @override
  State<RouterTela> createState() => _RouterTelaState();
}

class _RouterTelaState extends State<RouterTela> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainPage();
        } else {
          return PageLogin();
        }
      },
    );
  }
}
