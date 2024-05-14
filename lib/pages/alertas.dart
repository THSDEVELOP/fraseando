import 'package:flutter/material.dart';

class AlertasFraseando extends StatefulWidget {
  const AlertasFraseando({super.key});

  @override
  State<AlertasFraseando> createState() => _AlertasFraseandoState();
}

class _AlertasFraseandoState extends State<AlertasFraseando> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Text("Pagina de alerta"),
      ),
    );
  }
}
