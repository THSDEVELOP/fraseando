// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  static late double
      horizontalSpacing; // Espaçamento horizontal entre contêineres
  static late double containerWidth; // Largura do contêiner
  static late double containerHeight; // Altura do contêiner

  static void init(BuildContext context,
      {double horizontalSpacing = 2,
      double containerWidth = 80,
      double containerHeight = 10}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    SizeConfig.horizontalSpacing = horizontalSpacing;
    SizeConfig.containerWidth = containerWidth;
    SizeConfig.containerHeight = containerHeight;
  }

  static double getPercentageWidth(double percentage) {
    return screenWidth * (percentage / 100);
  }

  static double getPercentageHeight(double percentage) {
    return screenHeight * (percentage / 100);
  }

  static double getPercentageFontSize(double percentage) {
    return screenWidth * (percentage / 100);
  }

  static double getHorizontalSpacing() {
    return horizontalSpacing;
  }

  static double getContainerWidth() {
    return containerWidth;
  }

  static double getContainerHeight() {
    return containerHeight;
  }
}

//classe para tela settingsmain
class CustomButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
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
          height: MediaQuery.of(context).size.height * 0.125,
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
                style: const TextStyle(
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
