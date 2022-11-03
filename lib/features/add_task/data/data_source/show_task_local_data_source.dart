import '../../../../main.dart';
import '../models/task_model.dart';

abstract class ShowTaskLocalDataSource {
  Future<List<TaskModel>?> getAllTasks();
}

class ShowTaskLocalDataSourceImpl implements ShowTaskLocalDataSource {
  const ShowTaskLocalDataSourceImpl();

  @override
  Future<List<TaskModel>?> getAllTasks() async {
    final result = taskList ?? [];
    return List<TaskModel>.from(
        result.map((item) => TaskModel.fromJson(item as Map<String, dynamic>)));
  }
}
