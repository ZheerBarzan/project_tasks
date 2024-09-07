/* 

state mangement 

each cubit is a list of task

*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_task/domain/model/task.dart';
import 'package:project_task/domain/repository/task_repo.dart';

class TaskCubit extends Cubit<List<Task>> {
  final TaskRepo taskRepo;
  TaskCubit(this.taskRepo) : super(<Task>[]) {
    loadTasks();
  }

  //load
  Future<void> loadTasks() async {
    final taskList = await taskRepo.getTasks();
    emit(taskList);
  }

  //add
  Future<void> addTask(String text) async {
    final task = Task(title: text, id: DateTime.now().millisecondsSinceEpoch);
    await taskRepo.addTask(task);
    await loadTasks();
  }

  // delete
  Future<void> deleteTasks(Task task) async {
    await taskRepo.deleteTask(task);
    await loadTasks();
  }

  // toggole
  Future<void> toggleTask(Task task) async {
    final newTask = task.toggleCompletion();

    await taskRepo.updateTask(newTask);
    await loadTasks();
  }
}
