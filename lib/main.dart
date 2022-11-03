import 'package:flutter/material.dart';

import 'dependency_container.dart';
import 'features/add_task/data/models/task_model.dart';
import 'features/add_task/presentation/pages/task_page.dart';

List<TaskModel> taskList = [];
void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaskScreen(),
    );
  }
}
