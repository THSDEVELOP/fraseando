import 'package:flutter/material.dart';

import 'classSentings.dart';
import 'darkmodeSettings.dart';
import 'fontSettings.dart';
import 'languegeSettings.dart';
import 'notSettings.dart';
import 'secSettings.dart';

class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Alinha os elementos da Row espaçadamente
          children: [
            Spacer(),
            Text(
              'Config',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                print('Abrir barra de pesquisa');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade300, Colors.blue.shade800],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                'Segurança',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              CustomButton(
                icon: Icons.person,
                label: 'Supervisão',
                onPressed: () {},
              ),
              SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.lock,
                label: 'Senhas e Segurança',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecConfig()),
                  );
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Preferências',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(height: 20.0),
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
              SizedBox(height: 10.0),
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
              SizedBox(height: 10.0),
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
              SizedBox(height: 10.0),
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
              SizedBox(height: 20.0),
              Text(
                'Suas informações',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              CustomButton(
                icon: Icons.info_outline,
                label: 'Acessar suas informações',
                onPressed: () {
                  // Adicione aqui o código para ação do botão
                },
              ),
              SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.cloud_download,
                label: 'Baixar suas informações',
                onPressed: () {
                  // Adicione aqui o código para ação do botão
                },
              ),
              SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.swap_horiz,
                label: 'Transferir cópia das suas informações',
                onPressed: () {
                  // Adicione aqui o código para ação do botão
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Políticas legais',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              CustomButton(
                icon: Icons.description,
                label: 'Termos de serviço',
                onPressed: () {
                  // Adicione aqui o código para ação do botão
                },
              ),
              SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.assignment,
                label: 'Termos de uso',
                onPressed: () {
                  // Adicione aqui o código para ação do botão
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Ajuda',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.help_outline,
                label: 'Central de ajuda',
                onPressed: () {
                  // Adicione aqui o código para ação do botão
                },
              ),
              SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.help,
                label: 'Explicação dos botões',
                onPressed: () {
                  // Adicione aqui o código para ação do botão
                },
              ),
              SizedBox(height: 20.0),
              CustomButton(
                icon: Icons.exit_to_app,
                label: 'Sair',
                onPressed: () {
                  // Adicione aqui o código para sair
                },
              ),
              SizedBox(height: 10.0),
              CustomButton(
                icon: Icons.delete,
                label: 'Apagar conta',
                onPressed: () {
                  // Adicione aqui o código para apagar a conta
                },
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
