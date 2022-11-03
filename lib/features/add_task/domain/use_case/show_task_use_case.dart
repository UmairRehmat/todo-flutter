import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/task.dart';
import '../repository/show_task_repository.dart';

class AllTasksUseCase implements UseCase<List<TaskEntity>, NoParams> {
  final ShowTaskRepository _repository;
  const AllTasksUseCase(this._repository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(NoParams params) {
    return _repository.getAllTasks();
  }
}
