import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/states/todo_state.dart';

import '../models/todo.dart';

class InProgressPage extends StatelessWidget {
  const InProgressPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todoState = context.watch<TodoState>();

    if (todoState.todos.isEmpty) {
      return const Center(child: Text('is Empty :('));
    }

    return Center(
      child: renderTodos(todoState),
    );
  }

  ListView renderTodos(TodoState todoState) {
    return ListView(children: [
      for (Todo todo in todoState.todos)
        ListTile(
          leading: IconButton(
              onPressed: () => todoState.finishTodo(todo.id),
              icon: const Icon(Icons.check_box_outline_blank)),
          title: Text(todo.title),
        )
    ]);
  }
}
