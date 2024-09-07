/* 

ISAR todo model

converts todo model to isar model to store it in isar
*/

import 'package:isar/isar.dart';
import 'package:project_task/domain/model/task.dart';

// to generate isar object run :
part 'isar_task.g.dart';

@collection
class IsarTask {
  Id id = Isar.autoIncrement;
  late String title;
  late String? description;
  late bool isCompleted;

// convert isar model to todo model to display it in the app
  Task toDomain() {
    return Task(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted);
  }
// convert todo model to isar model to store it in isar

  static IsarTask fromDomain(Task task) {
    return IsarTask()
      ..id = task.id
      ..title = task.title
      ..description = task.description
      ..isCompleted = task.isCompleted;
  }
}
