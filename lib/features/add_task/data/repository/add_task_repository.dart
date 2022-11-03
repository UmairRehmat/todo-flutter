import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/task.dart';
import '../../domain/repository/add_task_repository.dart';
import '../data_source/add_task_local_data_source.dart';
import '../models/task_model.dart';

class AddTaskRepositoryImpl implements AddTaskRepository {
  final AddTasksLocalDataSource? localSource;
  const AddTaskRepositoryImpl({this.localSource});

  @override
  Future<Either<Failure, TaskEntity>> addTask(TaskEntity task) async {
    try {
      final taskParam = TaskModel(
        id: task.id,
          title: task.title,
          isDone: task.isDone);
      final taskModel = await localSource!.addTask(taskParam);
      return Right(taskModel);
    } on CacheException {
      return const Left(CacheFailure(errorAddTask));
    }
  }
}

const String errorAddTask = 'Error When add new Task';
