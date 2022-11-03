import '../../../../core/error/exceptions.dart';
import '../../../../main.dart';
import '../models/task_model.dart';

abstract class AddTasksLocalDataSource {
  Future<TaskModel> addTask(TaskModel task);
}

class AddTasksLocalDataSourceImpl implements AddTasksLocalDataSource {
  // final List<TaskModel> localList;
  const AddTasksLocalDataSourceImpl();

  @override
  Future<TaskModel> addTask(TaskModel task) async {
    try {
      taskList.add(task);
      return task;
    } catch (e) {
      throw CacheException();
    }
  }
}
