import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_task.dart';
import 'package:flutter_application_1/provider/tasks_provider.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Lista de Tarefas')),
      ),
      body: Center(
        child: Consumer<TaskProvider>(
          builder:
              (BuildContext context, TaskProvider provider, Widget? child) =>
                  ListView.builder(
            itemCount: provider.tasks.length,
            itemBuilder: (context, index) {
              return Center(
                child: Dismissible(
                  key: Key(provider.tasks[index]),
                  onDismissed: (direction) {},
                  child: ListTile(
                    title: Center(child: Text(provider.tasks[index])),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        // Navega para a página add_task e aguarda o resultado
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddTask()),
                        );

                        // Atualiza a tarefa se o resultado não for nulo
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navega para a página add_task e aguarda o resultado
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask()),
          );

          // Adiciona a nova tarefa à lista se o resultado não for nulo e não existir na lista
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
