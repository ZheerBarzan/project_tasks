import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_todo/data/models/isar_todo.dart';
import 'package:project_todo/data/repository/isar_todo_repo.dart';
import 'package:project_todo/domain/repository/todo_repo.dart';
import 'package:project_todo/presentaion/todo_page.dart';
import 'package:project_todo/presentaion/todo_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // get the directory for storing data
  final dir = await getApplicationDocumentsDirectory();

  //open isar database
  final isar = await Isar.open([IsarTodoSchema], directory: dir.path);

  //initialize the repo with isar database
  final isarTodoRepo = IsarTodoRepo(isar);

  //run
  runApp(MyApp(todoRepo: isarTodoRepo));
}

class MyApp extends StatelessWidget {
  final TodoRepo todoRepo;
  MyApp({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoPage(todoRepo: todoRepo),
    );
  }
}
