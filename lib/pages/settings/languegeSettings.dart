import 'package:flutter/material.dart';

import 'classSentings.dart';

class LanguageRegionSettings extends StatefulWidget {
  const LanguageRegionSettings({super.key});

  @override
  _LanguageRegionSettingsState createState() => _LanguageRegionSettingsState();
}

class _LanguageRegionSettingsState extends State<LanguageRegionSettings> {
  String _selectedLanguage = 'Português';
  String _selectedRegion = 'Brasil';

  List<String> _languages = ['Português', 'Inglês', 'Espanhol'];
  List<String> _regions = ['Brasil', 'Estados Unidos', 'Espanha'];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    double containerHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações de Idioma e Região',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade300,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade300,
              Colors.blue.shade800,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.getPercentageWidth(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Container(
                  height: containerHeight,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.getPercentageWidth(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.getPercentageWidth(2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Idioma:',
                          style: TextStyle(
                            fontSize: SizeConfig.getPercentageFontSize(4),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        DropdownButton<String>(
                          value: _selectedLanguage,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedLanguage = newValue!;
                            });
                          },
                          items: _languages
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(color: Colors.white)),
                            );
                          }).toList(),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                width: double.infinity,
                child: Container(
                  height: containerHeight,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.getPercentageWidth(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.getPercentageWidth(2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Região:',
                          style: TextStyle(
                            fontSize: SizeConfig.getPercentageFontSize(4),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        DropdownButton<String>(
                          value: _selectedRegion,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedRegion = newValue!;
                            });
                          },
                          items: _regions
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(color: Colors.white)),
                            );
                          }).toList(),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
