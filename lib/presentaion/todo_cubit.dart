/* 

state mangement 

each cubit is a list of TODO

*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_todo/domain/model/todo.dart';
import 'package:project_todo/domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  final TodoRepo todoRepo;
  TodoCubit(this.todoRepo) : super(<Todo>[]) {
    loadTodos();
  }

  //load
  Future<void> loadTodos() async {
    final todoList = await todoRepo.getTodos();
    emit(todoList);
  }

  //add
  Future<void> addTodo(String text) async {
    final todo = Todo(title: text, id: DateTime.now().millisecondsSinceEpoch);
    await todoRepo.addTodo(todo);
    await loadTodos();
  }

  // delete
  Future<void> deleteTodo(Todo todo) async {
    await todoRepo.deleteTodo(todo);
    await loadTodos();
  }

  // toggole
  Future<void> toggleTodo(Todo todo) async {
    final newTodo = todo.toggleCompletion();

    await todoRepo.updateTodo(newTodo);
    await loadTodos();
  }
}
