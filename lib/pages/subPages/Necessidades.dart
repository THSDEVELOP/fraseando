// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/customAppBar.dart';
import '../../components/customDrawer.dart';
import '../../components/custom_bottom_appbar.dart';
import '../../components/navigateToPage.dart';
import 'functionsPage/comidas.dart';

class NecessidadesPage extends StatefulWidget {
  const NecessidadesPage({super.key});

  @override
  _NecessidadesPageState createState() => _NecessidadesPageState();
}

class _NecessidadesPageState extends State<NecessidadesPage> {
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
          _buildListItem(
              "Roupas", "O que vamos vestir?", FontAwesomeIcons.tshirt),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              navigateToPage(context, const ComidasPage());
            },
            child: _buildListItem(
                "Comidas", "O que queremos hoje?", FontAwesomeIcons.hamburger),
          ),
          const SizedBox(height: 20),
          _buildListItem(
              "Atividades", "Verifique suas atividades!", Icons.task),
        ],
      ),
      backgroundColor: Colors.blue,
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
