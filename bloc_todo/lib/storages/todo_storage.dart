import 'package:bloc_todo/models/todo.dart';

class TodoStorage {
  List<Todo> todoList = [];

  Future<List<Todo>> fetch() {
    return Future<List<Todo>>.delayed(Duration(seconds: 3), () {
      todoList.add(Todo(todo: 'todo 1'));
      todoList.add(Todo(todo: 'todo 2'));
      todoList.add(Todo(todo: 'todo 3'));
      todoList.add(Todo(todo: 'todo 4'));
      todoList.add(Todo(todo: 'todo 5'));
      return todoList;
    });
  }

  void add(Todo todo) {
    todoList.add(todo);
  }

  void remove(Todo todo) {
    todoList.remove(todo);
  }
}
