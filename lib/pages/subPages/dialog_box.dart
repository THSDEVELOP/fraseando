import 'package:flutter/material.dart';

import 'mybuttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[200],
      content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //get user a input
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Adicione uma nova tarefa"),
              ),

              //botões de salvar e cancelar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //botao de salvar
                  MyButtons(text: "Salvar", onPressed: onSave),
                  const SizedBox(
                    width: 8,
                  ),
                  //botao de cancelar
                  MyButtons(text: "Cancelar", onPressed: onCancel),
                ],
              )
            ],
          )),
    );
  }
}
