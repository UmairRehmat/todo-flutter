import '../../../../core/error/failure.dart';
import '../../domain/entities/task.dart';
import 'package:dartz/dartz.dart';

abstract class AddTaskRepository {
  Future<Either<Failure, TaskEntity>> addTask(TaskEntity task);
}