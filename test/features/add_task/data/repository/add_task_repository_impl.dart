import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testtodo/features/add_task/data/data_source/add_task_local_data_source.dart';
import 'package:testtodo/features/add_task/data/models/task_model.dart';
import 'package:testtodo/features/add_task/data/repository/add_task_repository.dart';
import 'package:testtodo/features/add_task/domain/repository/add_task_repository.dart';

class MockAddTaskLocalDataSource extends Mock
    implements AddTasksLocalDataSource {}

void main() {
  MockAddTaskLocalDataSource? _localSource;
  AddTaskRepository? _repository;

  setUp(() {
    _localSource = MockAddTaskLocalDataSource();
    _repository = AddTaskRepositoryImpl(localSource: _localSource);
  });

  final tTaskModel = TaskModel(
    title: '',
    id: 1,
    isDone: false,
  );

  test('should return TaskModel when everything work fine', () async {
    //arrange
    when(() => _localSource!.addTask(tTaskModel))
        .thenAnswer((_) async => tTaskModel);
    //act
    final result = await _repository!.addTask(tTaskModel);
    //assert
    expect(result, equals(Right(tTaskModel)));
  });
}
