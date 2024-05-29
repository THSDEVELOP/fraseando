import 'package:flutter/material.dart';

import 'dialog_box.dart';
import 'todotile.dart';

class Tarefas extends StatefulWidget {
  const Tarefas({super.key});

  @override
  State<Tarefas> createState() => _HomePageState();
}

class _HomePageState extends State<Tarefas> {
  //text controller
  final _controller = TextEditingController();

  List toDoList = [
    ["Faça um tutorial", false],
    ["Faça um exercicio", false],
  ];

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  //creat new task
  void creatNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Tarefas'),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: creatNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask,
              );
            }));
  }
}
