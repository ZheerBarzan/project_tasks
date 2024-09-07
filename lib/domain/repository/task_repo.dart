/* 
repository for Tasks

this is where we define our methods
*/

import 'package:project_task/domain/model/task.dart';

abstract class TaskRepo {
  // get the list of tasks
  Future<List<Task>> getTasks();

  // add a task
  Future<void> addTask(Task task);

  // update a task
  Future<void> updateTask(Task task);

  // delete a task
  Future<void> deleteTask(Task task);
}

/*

NOTES: 
- TaskRepo is an abstract class that defines the methods to be implemented by the concrete classes.
- outlines the specific operations that can be performed on the Task object.
- but not thier implementation.

*/