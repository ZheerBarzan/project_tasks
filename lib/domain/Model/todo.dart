/*

-TODO Model
a Todo object is compoesed of these fields:

-ID
-Title
-Description
-IsCompleted
_______________________________________
-methods:

-toggle completion on and off


*/

class Todo {
  final int id;
  final String title;
  final String? description;
  final bool isCompleted;
  Todo(
      {required this.id,
      required this.title,
      this.description,
      this.isCompleted = false});

  Todo toggleCompletion() {
    return Todo(
        id: id,
        title: title,
        description: description,
        isCompleted: !isCompleted);
  }
}
