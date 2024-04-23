import 'package:flutter/material.dart';
import 'package:fraseando/pages/BoasVindas.dart';

void main() {
  runApp(const MyApp()); // Inicializa o aplicativo usando o widget MyApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: BoasVindas(), // Define BoasVindas como a tela inicial
    );
  }
}
