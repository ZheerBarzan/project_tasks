/* 
responisble for providing cubit to the view

using bloc provider

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_task/domain/repository/task_repo.dart';
import 'package:project_task/presentaion/task_cubit.dart';
import 'package:project_task/presentaion/task_view.dart';

class TaskPage extends StatelessWidget {
  final TaskRepo taskRepo;
  const TaskPage({super.key, required this.taskRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(taskRepo),
      child: const TaskView(),
    );
  }
}
