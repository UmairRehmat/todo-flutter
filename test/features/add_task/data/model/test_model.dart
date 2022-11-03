import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:talpodstodo/features/add_task/data/models/task_model.dart';
import 'package:talpodstodo/features/add_task/domain/entities/task.dart';

String ficture(String fileName) =>
    File('test/fixture/$fileName').readAsStringSync();

void main() {
  final tTaskModel = TaskModel(id: 1, title: 'title', isDone: false);

  test('should [TaskModel] equal [TaskEntity] subclass', () {
    //arrange
    //act
    //assert
    expect(TaskModel(), isA<TaskEntity>());
  });

  test('should convert json to [TaskModel]', () {
    //arrange
    //act
    final task = TaskModel.fromJson(json.decode(ficture('task.json')));
    //assert
    expect(task, equals(tTaskModel));
  });

  test('should convert model to json', () {
    //arrange
    final taskJson = json.decode(ficture('task.json'));
    //act
    final task = tTaskModel.toJson();
    //assert
    expect(task, equals(taskJson));
  });
}
