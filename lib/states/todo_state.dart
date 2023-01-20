import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

import '../models/todo.dart';

class TodoState extends ChangeNotifier {
  List<Todo> todos = [];
  List<Todo> finishedTodos = [];

  void addTodo() {
    todos.add(Todo(
        id: DateTime.now().millisecondsSinceEpoch / 1000,
        title: WordPair.random().toString()));
    notifyListeners();
  }

  void finishTodo(double id) {
    finishedTodos
        .add(todos.firstWhere((element) => element.id == id));
    todos.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
