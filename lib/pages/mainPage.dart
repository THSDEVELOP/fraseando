import 'package:flutter/material.dart';
import 'package:fraseando/pages/subPages/Necessidades.dart';
import '../components/customAppBar.dart';
import '../components/customDrawer.dart';
import '../components/custom_bottom_appbar.dart';
import '../components/navigateToPage.dart';
import 'subPages/tarefas.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isExpanded = false;

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
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
