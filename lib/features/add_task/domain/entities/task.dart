import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String? title;
  final int? id;
  bool isDone = false;


  TaskEntity({
    this.title,
    this.id,
    this.isDone = false,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        isDone,
      ];
}
