import 'package:flutter/material.dart';
import 'package:fraseando/pages/subPages/Necessidades.dart';
import '../components/customAppBar.dart';
import '../components/customDrawer.dart';
import '../components/navigateToPage.dart';
import '../settings/settingsMain.dart';
import 'subPages/alertas.dart';
import 'subPages/tarefas.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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

  Widget _buildListItem(String title, String subtitle, IconData icon) {
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: _isExpanded
                ? BorderRadius.circular(0)
                : BorderRadius.circular(20),
          ),
          child: Center(
            heightFactor: 1.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 40),
                Icon(
                  icon,
                  size: 60,
                  color: Colors.blueGrey,
                ),
                const SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
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
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        children: [
          _buildListItem("Emoções", "Como você está se sentindo hoje?",
              Icons.sentiment_satisfied),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              navigateToPage(context, const Tarefas());
            },
            child: _buildListItem(
                "Tarefas", "Confira suas tarefas de hoje!", Icons.done),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              navigateToPage(context, const NecessidadesPage());
            },
            child: _buildListItem("Necessidades",
                "Confira suas tarefas de hoje!", Icons.lightbulb_outline),
          ),
        ],
      ),
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomAppBar(
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
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 233, 229, 229),
                  ),
                  onPressed: () => _onItemTapped(1),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 233, 229, 229),
                  ),
                  onPressed: () {
                    navigateToPage(context, const MyHomePage());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings,
                      color: Color.fromARGB(255, 233, 229, 229)),
                  onPressed: () {
                    navigateToPage(context, SettingsScreen());
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
      ),
    );
  }
}
