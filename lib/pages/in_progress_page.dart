import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';

class InProgressPage extends StatefulWidget {
  const InProgressPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InProgressPage> createState() => _InProgressPageState();
}

class _InProgressPageState extends State<InProgressPage> {
  final List<Todo> _todos = [];
  final List<Todo> _finishedTodos = [];

  void _addTodo() {
    setState(() => {
          _todos.add(Todo(
              id: DateTime.now().millisecondsSinceEpoch / 1000,
              title: WordPair.random().toString()))
        });
  }

  void _finishTodo(double id) {
    setState(() => {
          _finishedTodos
              .add(_todos.firstWhere((element) => element.id == id)),
          _todos.removeWhere((element) => element.id == id),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('In Progress')),
      body: Center(
        child: _todos.isEmpty
            ? const Center(child: Text('is Empty :('))
            : renderTodos(),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _addTodo,
          tooltip: 'Add Todo',
          icon: const Icon(Icons.add),
          label: const Text('Create todo')),
    );
  }

  ListView renderTodos() {
    return ListView(children: [
      for (Todo todo in _todos)
        ListTile(
          leading: IconButton(
              onPressed: () => _finishTodo(todo.id),
              icon: const Icon(Icons.check_box_outline_blank)),
          title: Text(todo.title),
        )
    ]);
  }
}
