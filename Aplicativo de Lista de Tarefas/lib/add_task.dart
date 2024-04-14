import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  final List<String> tasks;

  AddTask(this.tasks);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String newTask = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Tarefa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                newTask = value;
              },
              onSubmitted: (value) {
                Navigator.pop(context, newTask); // Retorna a nova tarefa para a página main
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, newTask); // Retorna a nova tarefa para a página main
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
