import 'dart:async';

import 'package:bloc_todo/models/todo.dart';
import 'package:rxdart/subjects.dart';

class TodoStorage {
  static final TodoStorage instance = TodoStorage();

  final List<Todo> _todoList = [];
  final BehaviorSubject<List<Todo>> _todoListSubject = BehaviorSubject.seeded(
    [],
  );

  Stream<List<Todo>> get todoList => _todoListSubject.stream;

  void add(Todo todo) {
    _todoList.add(todo);
    _todoListSubject.sink.add(_todoList);
  }

  void remove(Todo todo) {
    _todoList.remove(todo);
    if (_todoListSubject.isClosed) {
      return;
    }
    _todoListSubject.sink.add(_todoList);
  }
}
