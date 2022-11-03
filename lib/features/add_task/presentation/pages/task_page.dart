import 'package:flutter/material.dart';
import '../../../../core/services/method_class.dart';
import '../../../../dependency_container.dart';
import '../../../../main.dart';
import '../../data/models/task_model.dart';

class TaskScreen extends StatefulWidget {
  final VoidCallback? onPressed;

  const TaskScreen({super.key, this.onPressed});

  @override
  TaskScreenState createState() => TaskScreenState();
}

class TaskScreenState extends State<TaskScreen> {
  // TextEditingController _taskController = TextEditingController();

  AddMethod addMethod = AddMethod(sl());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(20.0),
          key: const Key(
            "myListView",
          ),
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            TaskModel task = taskList[index];
            return Card(
              child: ListTile(
                  leading: Checkbox(
                    value: task.isDone,
                    onChanged: (bool? value) {
                      setState(() {
                        task.isDone = !task.isDone;
                      });
                    },
                  ),
                  trailing: Text(
                    task.isDone ? "Completed" : "Pending",
                    style: TextStyle(
                        color: task.isDone ? Colors.green : Colors.red,
                        fontSize: 15),
                  ),
                  title: Text(task.title ?? "Empty")),
            );
          }),
      floatingActionButton: FloatingActionButton(
        key: const Key("add_button"),
        onPressed: () {
          widget.onPressed?.call();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                title: const Text('Add New Task'),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    child: TextFormField(
                      controller: addMethod.titleController,
                      decoration: InputDecoration(
                        labelText: "Enter Task",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      validator: (task) {
                        if (task!.trim().isEmpty) {
                          return "Please enter task";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context, 42);
                        },
                        child: const Text('Cancel'),
                      ),
                      SimpleDialogOption(
                        child: const Text('Save'),
                        onPressed: () {
                          const snackBar = SnackBar(
                            content: Text('Please enter task'),
                          );
                          if (!addMethod.validateInputs) {
                            addMethod.saveTask(context);
                            setState(() {});
                            addMethod.clearControllers();
                            addMethod.goBack(context);
                          } else {
                            addMethod.goBack(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
