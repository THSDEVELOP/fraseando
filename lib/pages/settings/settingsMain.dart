import 'package:flutter/material.dart';

import '../../components/customAppBar.dart';
import 'classSentings.dart';
import 'darkmodeSettings.dart';
import 'fontSettings.dart';
import 'languegeSettings.dart';
import 'notSettings.dart';
import 'secSettings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const spacer = Spacer();
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20.0),
              const Text(
                'Segurança',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                icon: Icons.person,
                label: 'Supervisão',
                onPressed: () {},
              ),
              const SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.lock,
                label: 'Senhas e Segurança',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecConfig()),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Preferências',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                icon: Icons.notifications,
                label: 'Notificações',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationSettings()),
                  );
                },
              ),
              const SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.info,
                label: 'Idioma e região',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LanguageRegionSettings()),
                  );
                },
              ),
              const SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.brightness_3,
                label: 'Modo Escuro',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DarkModeSettings()),
                  );
                },
              ),
              const SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.text_format,
                label: 'Tamanho da fonte',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FontSettings()),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Suas informações',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                icon: Icons.info_outline,
                label: 'Acessar suas informações',
                onPressed: () {
                  // Adicione aqui o código para ação do botão
                },
              ),
              const SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.cloud_download,
                label: 'Baixar suas informações',
                onPressed: () {
                  // Adicione aqui o código para ação do botão
                },
              ),
              const SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.swap_horiz,
                label: 'Transferir informações',
                onPressed: () {
                  // Adicione aqui o código para ação do botão
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Políticas legais',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                icon: Icons.description,
                label: 'Termos de serviço',
                onPressed: () {
                  // Adicione aqui o código para ação do botão
                },
              ),
              const SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.assignment,
                label: 'Termos de uso',
                onPressed: () {
                  // Adicione aqui o código para ação do botão
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Ajuda',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.help_outline,
                label: 'Central de ajuda',
                onPressed: () {
                  // Adicione aqui o código para ação do botão
                },
              ),
              const SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.help,
                label: 'Explicação dos botões',
                onPressed: () {
                  // Adicione aqui o código para ação do botão
                },
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                icon: Icons.exit_to_app,
                label: 'Sair',
                onPressed: () {
                  // Adicione aqui o código para sair
                },
              ),
              const SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.delete,
                label: 'Apagar conta',
                onPressed: () {
                  // Adicione aqui o código para apagar a conta
                },
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
