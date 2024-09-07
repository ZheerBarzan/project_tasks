/*

-Task Model
a Task object is compoesed of these fields:

-ID
-Title
-Description
-IsCompleted
_______________________________________
-methods:

-toggle completion on and off


*/

class Task {
  final int id;
  final String title;
  final String? description;
  final bool isCompleted;
  Task(
      {required this.id,
      required this.title,
      this.description,
      this.isCompleted = false});

  Task toggleCompletion() {
    return Task(
        id: id,
        title: title,
        description: description,
        isCompleted: !isCompleted);
  }
}
