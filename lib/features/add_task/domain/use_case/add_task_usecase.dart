import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../../domain/entities/task.dart';
import '../repository/add_task_repository.dart';

class AddTaskUseCase extends UseCase<TaskEntity, AddTaskParam> {
  final AddTaskRepository _repository;
  AddTaskUseCase(this._repository);

  @override
  Future<Either<Failure, TaskEntity>> call(AddTaskParam params) {
    return _repository.addTask(params.taskEntity!);
  }
}