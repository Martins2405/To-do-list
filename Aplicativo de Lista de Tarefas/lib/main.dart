import 'package:flutter/material.dart';
import 'add_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskList(),
    );
  }
}

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Lista de Tarefas')),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Center(
              child: Dismissible(
                key: Key(tasks[index]),
                onDismissed: (direction) {
                  setState(() {
                    tasks.removeAt(index);
                  });
                },
                child: ListTile(
                  title: Center(child: Text(tasks[index])),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      // Navega para a página add_task e aguarda o resultado
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddTask(tasks)),
                      );

                      // Atualiza a tarefa se o resultado não for nulo
                      if (result != null) {
                        setState(() {
                          tasks[index] = result;
                        });
                      }
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navega para a página add_task e aguarda o resultado
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask(tasks)),
          );

          // Adiciona a nova tarefa à lista se o resultado não for nulo e não existir na lista
          if (result != null && !tasks.contains(result)) {
            setState(() {
              tasks.add(result);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
