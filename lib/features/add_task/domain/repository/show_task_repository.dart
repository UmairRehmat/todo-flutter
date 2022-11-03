import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';

abstract class ShowTaskRepository {
  Future<Either<Failure,List<TaskEntity>>> getAllTasks();


}