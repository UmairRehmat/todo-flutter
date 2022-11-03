import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testtodo/core/error/failure.dart';
import 'package:testtodo/core/usecases/use_case.dart';
import 'package:testtodo/features/add_task/domain/entities/task.dart';
import 'package:testtodo/features/add_task/domain/repository/add_task_repository.dart';
import 'package:testtodo/features/add_task/domain/use_case/add_task_usecase.dart';

class MockAddTaskRepository extends Mock implements AddTaskRepository {}

void main() {
  MockAddTaskRepository? repository;
  AddTaskUseCase? useCase;

  setUp(() {
    repository = MockAddTaskRepository();
    useCase = AddTaskUseCase(repository!);
  });

  final tTask = TaskEntity(
    title: '',
    id: 1,
    isDone: false,
  );

  final tTaskModel = TaskEntity(
    title: '',
    id: 1,
    isDone: false,
  );

  test('should return Task Entity when data return success', () async {
    //arrange
    when(() => repository!.addTask(tTaskModel))
        .thenAnswer((_) async => Right(tTask));
    //act
    final result = await useCase!(AddTaskParam(tTaskModel));
    //assert
    verify(() => repository!.addTask(tTaskModel));
    verifyNoMoreInteractions(repository);
    expect(result, equals(Right(tTask)));
  });

  test('should return Failure when data return error', () async {
    //arrange
    when(() => repository!.addTask(tTaskModel))
        .thenAnswer((_) async => const Left(Failure()));
    //act
    final result = await useCase!(AddTaskParam(tTaskModel));
    //assert
    verify(() => repository!.addTask(tTaskModel));
    verifyNoMoreInteractions(repository);
    expect(result, equals(const Left(Failure())));
  });
}
