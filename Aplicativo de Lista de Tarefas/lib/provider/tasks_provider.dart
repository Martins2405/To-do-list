import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  List<String> _tasks = ["LALALA", "LELELLELE"];

  List<String> get tasks => _tasks;

  set tasks(List<String> value) {
    _tasks = value;
  }

  void addTask(String task) {
    _tasks.add(task);
    notifyListeners();
  }
}
