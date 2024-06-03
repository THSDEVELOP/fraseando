import 'package:flutter/material.dart';

import '../../components/customAppBar.dart';
import '../../components/customDrawer.dart';

class AlertasFraseando extends StatefulWidget {
  const AlertasFraseando({super.key});

  @override
  State<AlertasFraseando> createState() => _AlertasFraseandoState();
}

class _AlertasFraseandoState extends State<AlertasFraseando> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Container(
        color: Colors.white,
        child: Text("Pagina de alerta"),
      ),
    );
  }
}
