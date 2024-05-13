import 'package:flutter/material.dart';
import 'package:fraseando/pages/pageLogin.dart';
import 'package:fraseando/servicos/autentication.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _isExpanded = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  Widget _buildListItem(String title, IconData icon) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy < -10) {
          _toggleExpand();
        }
      },
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx.abs() > 10) {
          _toggleExpand();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: _isExpanded
                ? BorderRadius.circular(0)
                : BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 60,
                  color: Colors.blueGrey,
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          centerTitle: true,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Bem-vindo",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sair"),
              onTap: () {
                AutenticacaoServico().deslogar();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PageLogin()));
              },
            )
          ],
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        children: [
          _buildListItem("Emoções", Icons.sentiment_satisfied),
          const SizedBox(height: 20),
          _buildListItem("Tarefas", Icons.done),
          const SizedBox(height: 20),
          _buildListItem("Necessidades", Icons.lightbulb_outline),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[300],
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[300],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () => _onItemTapped(1),
                ),
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () => _onItemTapped(2),
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () => _onItemTapped(3),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () => _onItemTapped(4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
