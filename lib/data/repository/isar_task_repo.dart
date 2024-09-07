/*

DATABASE REPO:

this is all about the isar implementation of the database

*/

import 'package:isar/isar.dart';
import 'package:project_task/domain/model/task.dart';
import 'package:project_task/domain/repository/task_repo.dart';

class IsarTaskRepo implements TaskRepo {
  final Isar db;

  IsarTaskRepo(this.db);

  @override
  Future<void> addTask(Task task) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask(Task task) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getTasks() {
    // TODO: implement getTasks
    throw UnimplementedError();
  }

  @override
  Future<void> updateTask(Task task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
