/* 

ISAR todo model

converts todo model to isar model to store it in isar
*/

import 'package:isar/isar.dart';
import 'package:project_todo/domain/model/todo.dart';

// to generate isar object run :
part 'isar_todo.g.dart';

@collection
class IsarTodo {
  Id id = Isar.autoIncrement;
  late String title;
  late String? description;
  late bool isCompleted;

// convert isar model to todo model to display it in the app
  Todo ToDomain() {
    return Todo(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted);
  }
// convert todo model to isar model to store it in isar

  static IsarTodo FromDomain(Todo todo) {
    return IsarTodo()
      ..id = todo.id
      ..title = todo.title
      ..description = todo.description
      ..isCompleted = todo.isCompleted;
  }
}
