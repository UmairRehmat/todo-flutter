import 'package:flutter/material.dart';
import 'package:talpodstodo/main.dart';
import 'package:talpodstodo/models/todo_model.dart';

class MainViewScreen extends StatefulWidget {
  const MainViewScreen({super.key});

  @override
  State<MainViewScreen> createState() => _MainViewScreenState();
}

class _MainViewScreenState extends State<MainViewScreen> {
  final TextEditingController _textEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo app"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: openDialogForNewTask,
      ),
      body: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (BuildContext context, int index) {
            TodoModel task = tasksList[index];
            return ListTile(
                leading: Checkbox(
                  value: task.isDone,
                  onChanged: (bool? value) {
                    setState(() {
                      tasksList[index].isDone = !tasksList[index].isDone;
                    });
                  },
                ),
                trailing: Text(
                  task.isDone ? "Completed" : "Not yet",
                  style: TextStyle(
                      color: task.isDone ? Colors.green : Colors.red,
                      fontSize: 15),
                ),
                title: Text(task.name ?? "Empty"));
          }),
    );
  }

  openDialogForNewTask() {
    var dialog = SimpleDialog(
      title: const Text("Add Your new task"),
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textEditController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: gettingBack, child: const Text("Cancel")),
                  TextButton(onPressed: saveNewTask, child: const Text("Save")),
                ],
              ),
            ],
          ),
        )
      ],
    );
    showDialog(context: context, builder: (context) => dialog);
  }

  void saveNewTask() {
    if (_textEditController.value.text.isEmpty) {
      return;
    }
    TodoModel task =
        TodoModel(id: 1, name: _textEditController.text, isDone: false);
    _textEditController.clear();
    tasksList.add(task);
    gettingBack();
    setState(() {});
  }

  void gettingBack() {
    Navigator.pop(context);
  }
}
