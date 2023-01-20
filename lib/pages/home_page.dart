import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/todo_state.dart';
import 'in_progress_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var todoState = context.watch<TodoState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wow'),
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: const [
          DrawerHeader(child: Text('Thanmatt Todos')),
        ]),
      ),
      body: const InProgressPage(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: todoState.addTodo,
          tooltip: 'Add Todo',
          icon: const Icon(Icons.add),
          label: const Text('Create todo')),
    );
  }
}
