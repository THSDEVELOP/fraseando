import 'package:flutter/material.dart';

import 'classSentings.dart';

class FontSettings extends StatefulWidget {
  @override
  _FontSettingsState createState() => _FontSettingsState();
}

class _FontSettingsState extends State<FontSettings> {
  double _fontSize = 20.0; // Tamanho da fonte inicial
  List<double> _fontSizes = [
    10,
    20,
    30,
    40,
    50
  ]; // Lista de tamanhos de fonte disponíveis

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Inicializando a classe SizeConfig

    return Scaffold(
      appBar: AppBar(
        title: Text('Ajuste de Tamanho da Fonte'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
              height: SizeConfig.getPercentageHeight(
                  5)), // SizedBox com 5% da altura da tela
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getPercentageWidth(
                    5)), // Adicionando margens horizontais
            child: Container(
              height: SizeConfig.getPercentageHeight(
                  10), // Definindo a altura do container como 10% da altura da tela
              decoration: BoxDecoration(
                color: Colors.grey[200], // Cor do container
                borderRadius:
                    BorderRadius.circular(SizeConfig.getPercentageWidth(5)),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.getPercentageWidth(2)),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Tamanho da Fonte: ',
                      style:
                          TextStyle(fontSize: _fontSize, color: Colors.black),
                    ),
                    SizedBox(
                        width: SizeConfig.getPercentageWidth(
                            5)), // Espaçamento entre o texto e o DropdownButton
                    DropdownButton<double>(
                      value: _fontSize,
                      items: _fontSizes.map((double value) {
                        return DropdownMenuItem<double>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (double? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _fontSize = newValue;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
