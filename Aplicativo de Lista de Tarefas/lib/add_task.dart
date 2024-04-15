import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/tasks_provider.dart';
import 'package:provider/provider.dart';

class AddTask extends StatefulWidget {
  AddTask();

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: (value) {
                Provider.of<TaskProvider>(context, listen: false).addTask(_controller.text);
                Navigator.of(context).pop();
              },
              decoration: const InputDecoration(
                labelText: 'Tarefa',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Provider.of<TaskProvider>(context, listen: false).addTask(_controller.text);
                Navigator.of(context).pop();
              },
              child: const Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
