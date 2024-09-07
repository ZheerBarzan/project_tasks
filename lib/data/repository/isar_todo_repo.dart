/*

DATABASE REPO:

this is all about the isar implementation of the database

*/

import 'package:isar/isar.dart';
import 'package:project_todo/data/models/isar_todo.dart';
import 'package:project_todo/domain/model/todo.dart';
import 'package:project_todo/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;

  IsarTodoRepo(this.db);
  @override
  Future<void> addTodo(Todo todo) async {
    // convert todo model to isar model
    final todoIsar = IsarTodo.FromDomain(todo);

    // store in the database
    return db.writeTxn(() => db.isarTodos.put(todoIsar));
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await db.writeTxn(() => db.isarTodos.delete(todo.id));
  }

  @override
  Future<List<Todo>> getTodos() async {
    // fetch from the database

    final todos = await db.isarTodos.where().findAll();
    // return the list of todos and give to domain layer
    return todos.map((isarTodo) => isarTodo.ToDomain()).toList();
  }

  @override
  Future<void> updateTodo(Todo todo) {
    // convert todo model to isar model
    final todoIsar = IsarTodo.FromDomain(todo);

    // store in the database
    return db.writeTxn(() => db.isarTodos.put(todoIsar));
  }
}
