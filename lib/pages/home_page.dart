import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Wow'),
      ),
      drawer: Drawer(
        child: ListView(children: [
          const DrawerHeader(child: Text('Thanmatt Todos')),
        ], padding: EdgeInsets.zero),
      ),
      body: const InProgressPage(),
    );
  }
}
