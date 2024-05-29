import 'package:flutter/material.dart';

import 'classSentings.dart';

class SecConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.blue.shade300, // Cor da barra superior igual à tela anterior
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Text(
              'Segurança',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors
                      .white), // Tamanho da fonte ajustado para 20 e texto branco
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.shade300,
                  Colors.blue.shade800
                ], // Gradiente de cores
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20), // Espaçamento superior
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: CustomButton(
                    icon: Icons.person,
                    label: 'Alterar senha',
                    onPressed: () {
                      // Adicione aqui o código para a ação do botão
                    },
                  ),
                ),
                SizedBox(height: 20), // Espaçamento entre botões
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: CustomButton(
                    icon: Icons.lock,
                    label: 'Autentificação de dois fatores',
                    onPressed: () {
                      // Adicione aqui o código para a ação do botão
                    },
                  ),
                ),
                SizedBox(height: 20), // Espaçamento entre botões
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: CustomButton(
                    icon: Icons.lock,
                    label: 'Login Salvo',
                    onPressed: () {
                      // Adicione aqui o código para a ação do botão
                    },
                  ),
                ),
                SizedBox(height: 20), // Espaçamento inferior
              ],
            ),
          ),
        ],
      ),
    );
  }
}
