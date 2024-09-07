/* 
repository for Todo

this is where we define our methods
*/

import 'package:project_todo/domain/model/todo.dart';

abstract class TodoRepo {
  // get the list of todos
  Future<List<Todo>> getTodos();

  // add a todo
  Future<void> addTodo(Todo todo);

  // update a todo
  Future<void> updateTodo(Todo todo);

  // delete a todo
  Future<void> deleteTodo(Todo todo);
}

/*

NOTES: 
- TodoRepo is an abstract class that defines the methods to be implemented by the concrete classes.
- outlines the specific operations that can be performed on the Todo object.
- but not thier implementation.

*/