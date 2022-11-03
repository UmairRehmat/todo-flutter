import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testtodo/core/error/failure.dart';
import 'package:testtodo/core/usecases/use_case.dart';
import 'package:testtodo/features/add_task/domain/entities/task.dart';

import 'package:testtodo/features/add_task/domain/repository/show_task_repository.dart';
import 'package:testtodo/features/add_task/domain/use_case/show_task_use_case.dart';

class MockHomeRepository extends Mock implements ShowTaskRepository {}

void main() {
  MockHomeRepository? repository;
  AllTasksUseCase? getAllTasks;

  setUp(() {
    repository = MockHomeRepository();
    getAllTasks = AllTasksUseCase(repository!);
  });

  final tasks = [
    TaskEntity(
      id: 0,
      title: '',
      isDone: false,
    ),
    TaskEntity(
      id: 0,
      title: '',
      isDone: false,
    ),
    TaskEntity(
      id: 0,
      title: '',
      isDone: false,
    ),
  ];

  test('should call repository one time when call use case', () async {
    //arrange
    when(() => repository!.getAllTasks()).thenAnswer((_) async => Right(tasks));
    //act
    await getAllTasks!(NoParams());
    //assert
    verify(() => repository!.getAllTasks());
    verifyNoMoreInteractions(repository);
  });

  test('should return list of tasks when return right side of repository',
      () async {
    //arrange
    when(() => repository!.getAllTasks()).thenAnswer((_) async => Right(tasks));
    //act
    final result = await getAllTasks!(NoParams());
    //assert
    expect(result, equals(Right(tasks)));
  });

  test('should return failure when repository return [ERROR] failure',
      () async {
    //arrange
    when(() => repository!.getAllTasks())
        .thenAnswer((_) async => const Left(Failure()));
    //act
    final result = await getAllTasks!(NoParams());
    //assert
    expect(result, equals(const Left(Failure())));
  });
}
