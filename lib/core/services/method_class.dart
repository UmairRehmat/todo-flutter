

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../features/add_task/data/models/task_model.dart';
import '../../features/add_task/domain/use_case/add_task_usecase.dart';
import '../usecases/use_case.dart';
import 'add_task_status.dart';


class AddMethod extends AddTaskState{

  // AddMethod? _method;
  final AddTaskUseCase addTaskUseCase;
  AddMethod(this.addTaskUseCase);
  var uuid = Uuid();
  int? _id;
  TextEditingController titleController = TextEditingController();

 randomId(){
   _id  = int.parse(uuid.v1().toString());
   debugPrint("Random Id:- $_id");
 }
  TaskModel get _task => TaskModel(

    id: _id,
      title: titleController.text,
      isDone: false,
  );

  bool get validateInputs =>
      titleController.text.isEmpty;


  void saveTask(BuildContext context) async {

    if (validateInputs) {
      const SnackBar(content: Text("Please enter task"));
      return;
    }
    addTaskUseCase.call(AddTaskParam(_task));
  }


  void clearControllers() {
    titleController.clear();
  }

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  // addTask(String task) {
  //   try {
  //     TaskModel list = TaskModel(title: task);
  //     taskList.add(list);
  //     Navigator.pop(context);
  //     setState(() {});
  //     _taskController.clear();
  //     debugPrint("List:- ${taskList.length}");
  //   } catch (e) {
  //     debugPrint("error $e");
  //   }
  // }
}
