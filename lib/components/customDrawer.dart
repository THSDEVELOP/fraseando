import 'package:flutter/material.dart';
import '../servicos/autentication.dart';
import '../pages/pageLogin.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      backgroundColor: Colors.blue,
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.white),
            title: const Text(
              "Sair",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              AutenticacaoServico().deslogar();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PageLogin()));
            },
          )
        ],
      ),
    );
  }
}
