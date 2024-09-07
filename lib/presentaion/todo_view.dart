/* 
responisble for providing cubit to the view

using bloc builder

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_todo/domain/model/todo.dart';
import 'package:project_todo/presentaion/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Add Todo'),
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
                    todoCubit.addTodo(textController.text);
                    Navigator.of(context).pop();
                    textController.clear();
                  },
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoBox(context),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final task = todos[index];
              return ListTile(
                title: Text(task.title),

                //check box
                leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) => todoCubit.toggleTodo(task)),
              );
            },
          );
        },
      ),
    );
  }
}
