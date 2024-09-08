/*

DATABASE REPO:

this is all about the isar implementation of the database

*/

import 'package:isar/isar.dart';
import 'package:project_task/data/models/isar_task.dart';
import 'package:project_task/domain/model/task.dart';
import 'package:project_task/domain/repository/task_repo.dart';

class IsarTaskRepo implements TaskRepo {
  final Isar db;

  IsarTaskRepo(this.db);

  @override
  Future<void> addTask(Task task) async {
    final taskIsar = IsarTask.fromDomain(task);

    return db.writeTxn(() => db.isarTasks.put(taskIsar));
  }

  @override
  Future<void> deleteTask(Task task) async {
    await db.writeTxn(() => db.isarTasks.delete(task.id));
  }

  @override
  Future<List<Task>> getTasks() async {
    final tasks = await db.isarTasks.where().findAll();

    return tasks.map((isarTask) => isarTask.toDomain()).toList();
  }

  @override
  Future<void> updateTask(Task task) {
    final taskIsar = IsarTask.fromDomain(task);

    return db.writeTxn(() => db.isarTasks.put(taskIsar));
  }
}
