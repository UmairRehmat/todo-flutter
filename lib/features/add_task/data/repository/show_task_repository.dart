import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/task.dart';
import '../../domain/repository/show_task_repository.dart';
import '../data_source/show_task_local_data_source.dart';

class ShowTaskRepositoryImpl implements ShowTaskRepository {
  final ShowTaskLocalDataSource _localSource;
  const ShowTaskRepositoryImpl(this._localSource);

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks() async {
    final result = await _localSource.getAllTasks();
    if (result != null) {
      return Right(result);
    } else {
      return const Left(CacheFailure(errorGetTasks));
    }
  }

}

const String errorGetTasks = 'Error in get tasks';
