// lib/components/custom_bottom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:fraseando/pages/subPages/alertas.dart';
import 'package:fraseando/pages/mainPage.dart';
import 'package:fraseando/components/navigateToPage.dart';

import '../pages/settings/settingsMain.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      color: Colors.blue,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_circle,
                    color: Color.fromARGB(255, 233, 229, 229)),
                onPressed: () {
                  navigateToPage(context, const AlertasFraseando());
                },
              ),
              IconButton(
                icon: const Icon(Icons.person,
                    color: Color.fromARGB(255, 233, 229, 229)),
                onPressed: () {
                  navigateToPage(context, const AlertasFraseando());
                },
              ),
              IconButton(
                icon: const Icon(Icons.home,
                    color: Color.fromARGB(255, 233, 229, 229)),
                onPressed: () {
                  navigateToPage(context, const MyHomePage());
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings,
                    color: Color.fromARGB(255, 233, 229, 229)),
                onPressed: () {
                  navigateToPage(context, const SettingsScreen());
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications,
                    color: Color.fromARGB(255, 233, 229, 229)),
                onPressed: () {
                  navigateToPage(context, const AlertasFraseando());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
