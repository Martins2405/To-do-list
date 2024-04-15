import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/tasks_provider.dart';
import 'package:flutter_application_1/task_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskProvider>(
          create: (BuildContext context) => TaskProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Lista de Tarefas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskList(),
      ),
    );
  }
}