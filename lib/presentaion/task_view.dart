/* 
responisble for providing cubit to the view

using bloc builder

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_task/domain/model/task.dart';
import 'package:project_task/presentaion/task_cubit.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  void _showAddTaskBox(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();
    final textController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Add Task'),
              content: TextField(controller: textController),
              actions: [
                MaterialButton(
                  child: const Text("cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    textController.clear();
                  },
                ),
                MaterialButton(
                  child: const Text("Add"),
                  onPressed: () {
                    taskCubit.addTask(textController.text);
                    Navigator.of(context).pop();
                    textController.clear();
                  },
                ),
              ],
            ));
  }

  void _showUpdateTaskBox(BuildContext context, Task task) {
    final taskCubit = context.read<TaskCubit>();
    final textController = TextEditingController();
    textController.text = task.title;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Task'),
        content: TextField(controller: textController),
        actions: [
          MaterialButton(
            child: const Text("cancel"),
            onPressed: () {
              Navigator.of(context).pop();
              textController.clear();
            },
          ),
          MaterialButton(
            child: const Text("Update"),
            onPressed: () {
              taskCubit.updateTask(task, textController.text);
              Navigator.of(context).pop();
              textController.clear();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('T A S K S'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        onPressed: () => _showAddTaskBox(context),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TaskCubit, List<Task>>(
        builder: (context, tasks) {
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) =>
                            _showUpdateTaskBox(context, task),
                        backgroundColor: Colors.grey.shade800,
                        icon: Icons.edit,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      SlidableAction(
                        onPressed: (value) => taskCubit.deleteTasks(task),
                        backgroundColor: Colors.redAccent,
                        icon: Icons.delete,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(5),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                            activeColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            value: task.isCompleted,
                            onChanged: (value) => taskCubit.toggleTask(
                                  task,
                                )),
                        !task.isCompleted
                            ? Text(task.title,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary))
                            : Text(
                                task.title,
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough),
                              ),
                      ],
                    ),

                    //check box
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
