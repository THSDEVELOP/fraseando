import 'package:flutter/material.dart';

import 'contact.dart';
import 'contactPro.dart';

class Chamada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double buttonHeight = screenHeight * 0.10;
    final double spacingHeight = screenHeight * 0.05;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Chamada'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: screenHeight, // Ocupa a altura total da tela
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade300, Colors.blue.shade800],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: spacingHeight), // Espaçamento de 5% no topo
            CustomButton(
              icon: Icons.person,
              label: 'conhecidos',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContatosSalvos()),
                );
              },
              height: buttonHeight,
            ),
            SizedBox(height: spacingHeight),
            CustomButton(
              icon: Icons.security,
              label: 'Profissionais',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContatosEmergencia()),
                );
              },
              height: buttonHeight,
            ),
            SizedBox(height: spacingHeight),
            CustomButton(
              icon: Icons.warning,
              label: 'Alertas',
              onPressed: () {
                // Ação do botão Alertas
                print('Botão Alertas pressionado');
              },
              height: buttonHeight,
            ),
            SizedBox(height: spacingHeight),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final double height;

  CustomButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.blue,
            Colors.lightBlue,
            Color.fromARGB(255, 159, 241, 255),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors
              .transparent, // Definindo o fundo do botão como transparente
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Container(
          margin:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
          alignment: Alignment.center,
          child: Row(
            // Layout horizontal para ícone e texto
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white, // Alterando a cor do ícone para branco
              ), // Ícone
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Text(
                label,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16), // Alterando a cor do texto para branco
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdicionarContato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Contato'),
      ),
      body: Center(
        child: Text('Tela de Adicionar Contato'),
      ),
    );
  }
}
