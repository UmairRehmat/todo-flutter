import '../../domain/entities/task.dart';

class TaskModel extends TaskEntity{
/*
{
  "id": 1,
  "title": "hello work",
  "is_done": true
}
*/



  int? id;
  String? title;
  bool isDone = false;



  TaskModel({
    this.id,
    this.title,
    this.isDone=false,
  }) : super(
  id: id,
  isDone: isDone,
  title: title);

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    title = json['title']?.toString();
    isDone = json['is_done'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['is_done'] = isDone;
    return data;
  }
}