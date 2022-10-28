import 'package:flutter/material.dart';
import 'package:talpodstodo/screens/main_view_screen.dart';
import 'package:talpodstodo/utils/constants.dart';
import 'models/todo_model.dart';

List<TodoModel> tasksList = [];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainViewScreen(),
    );
  }
}
