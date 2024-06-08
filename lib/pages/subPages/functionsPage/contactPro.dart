import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contato {
  final String nome;
  final String numero;
  final String fotoUrl;

  Contato({required this.nome, required this.numero, required this.fotoUrl});
}

class ContatosEmergencia extends StatelessWidget {
  final List<Contato> contatos = [
    Contato(nome: 'SAMU', numero: '192', fotoUrl: 'https://via.placeholder.com/150'),
    Contato(nome: 'Polícia', numero: '190', fotoUrl: 'https://via.placeholder.com/150'),
    Contato(nome: 'Bombeiros', numero: '193', fotoUrl: 'https://via.placeholder.com/150'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Números de Emergência'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade300, Colors.blue.shade800],
          ),
        ),
        child: ListView.builder(
          itemCount: contatos.length,
          itemBuilder: (context, index) {
            final contato = contatos[index];
            return CustomButton(
              icon: _getIcon(contato.nome),
              label: contato.nome,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContatoDetalhes(contato: contato),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  IconData _getIcon(String nome) {
    switch (nome) {
      case 'SAMU':
        return Icons.local_hospital;
      case 'Polícia':
        return Icons.policy;
      case 'Bombeiros':
        return Icons.local_fire_department;
      default:
        return Icons.person;
    }
  }
}

class ContatoDetalhes extends StatefulWidget {
  final Contato contato;

  ContatoDetalhes({required this.contato});

  @override
  _ContatoDetalhesState createState() => _ContatoDetalhesState();
}

class _ContatoDetalhesState extends State<ContatoDetalhes> {
  late TextEditingController _nomeController;
  late TextEditingController _numeroController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.contato.nome);
    _numeroController = TextEditingController(text: widget.contato.numero);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _numeroController.dispose();
    super.dispose();
  }

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
        title: Text('Detalhes do Número de Emergência'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade300, Colors.blue.shade800],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.contato.fotoUrl),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _nomeController,
                style: TextStyle(fontSize: 24, color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: Colors.white70, fontSize: 20),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _numeroController,
                style: TextStyle(fontSize: 20, color: Colors.white70),
                decoration: InputDecoration(
                  labelText: 'Número',
                  labelStyle: TextStyle(color: Colors.white70, fontSize: 18),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              CustomButton(
                icon: Icons.phone,
                label: 'Ligar',
                onPressed: () async {
                  final String numero = _numeroController.text;
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: numero,
                  );
                  await launchUrl(launchUri);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
          height: MediaQuery.of(context).size.height * 0.125,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Text(
                label,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
