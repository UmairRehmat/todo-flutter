class TodoModel {
/*
{
  "id": 1,
  "name": "hello work",
  "is_done": true
}
*/

  int? id;
  String? name;
  bool isDone = false;

  TodoModel({
    this.id,
    this.name,
    this.isDone = false,
  });
  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    isDone = json['is_done'] ?? false;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['is_done'] = isDone;
    return data;
  }
}
