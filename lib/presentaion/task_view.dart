/* 
responisble for providing cubit to the view

using bloc builder

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_task/domain/model/task.dart';
import 'package:project_task/presentaion/components/my_drawer.dart';
import 'package:project_task/presentaion/task_cubit.dart';

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

  @override
  Widget build(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('T A S K S'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskBox(context),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TaskCubit, List<Task>>(
        builder: (context, tasks) {
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Row(
                  children: [
                    Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) => taskCubit.toggleTask(task)),
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
              );
            },
          );
        },
      ),
    );
  }
}
