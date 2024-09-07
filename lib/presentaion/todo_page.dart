/* 
responisble for providing cubit to the view

using bloc provider

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_todo/domain/repository/todo_repo.dart';
import 'package:project_todo/presentaion/todo_cubit.dart';
import 'package:project_todo/presentaion/todo_view.dart';

class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;
  const TodoPage({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepo),
      child: const TodoView(),
    );
  }
}
