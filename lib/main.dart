import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_task/data/models/isar_task.dart';
import 'package:project_task/data/repository/isar_task_repo.dart';
import 'package:project_task/domain/repository/task_repo.dart';
import 'package:project_task/presentaion/task_page.dart';
import 'package:project_task/theme/dark_theme.dart';
import 'package:project_task/theme/light_theme.dart';
import 'package:project_task/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // get the directory for storing data
  final dir = await getApplicationDocumentsDirectory();

  //open isar database
  final isar = await Isar.open([IsarTaskSchema], directory: dir.path);

  //initialize the repo with isar database
  final isarTaskRepo = IsarTaskRepo(isar);

  //run
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(taskRepo: isarTaskRepo)));
}

class MyApp extends StatelessWidget {
  final TaskRepo taskRepo;
  const MyApp({super.key, required this.taskRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task',
      theme: lightMode,
      darkTheme: darkMode,
      home: TaskPage(taskRepo: taskRepo),
    );
  }
}
