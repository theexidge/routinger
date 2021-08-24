import 'package:flutter/material.dart';

// Screen Imports
import './screens/home_screen.dart';
import './screens/add_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routinger',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        AddTask.routeName: (ctx) => AddTask(),
      },
    );
  }
}
