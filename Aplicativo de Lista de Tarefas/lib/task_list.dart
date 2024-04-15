import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/tasks_provider.dart';
import 'package:flutter_application_1/add_task.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  TaskList();

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Lista de Tarefas')),
      ),
      body:  Consumer<TaskProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.tasks.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(provider.tasks[index]),
                background: Container(
                  color: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white),
                  alignment: Alignment.centerRight,
                ),
                onDismissed: (direction) {
                  provider.removeTask(index);
                },
                child: ListTile(
                  title: Center(child: Text(provider.tasks[index])),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _controller.text = provider.tasks[index];
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Editar Tarefa'),
                                content: TextField(
                                  controller: _controller,
                                  onSubmitted: (value) {
                                    provider.updateTask(index, _controller.text);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancelar'),
                                  ),
                                  
                                  TextButton(
                                    onPressed: () {
                                      provider.updateTask(index, _controller.text);
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Salvar'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          provider.removeTask(index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTask(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
