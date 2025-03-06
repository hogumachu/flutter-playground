import 'dart:async';
import 'package:bloc_todo/app_router/routes.dart';
import 'package:bloc_todo/models/todo.dart';
import 'package:bloc_todo/storages/todo_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc.freezed.dart';

typedef Event = HomeEvent;
typedef State = HomeState;

class HomeBloc extends Bloc<Event, State> {
  HomeBloc(this._storage, this._push) : super(State.initial()) {
    _dispatch();
  }

  final TodoStorage _storage;
  final Function(String) _push;

  void _dispatch() {
    on<Event>((event, emit) {
      switch (event) {
        case _Initial _:
          return _initialized(emit);
        case _TodoTapped e:
          return _todoTapped(emit, e);
        case _CreateTapped e:
          return _createTapped(emit, e);
      }
    });
  }

  void _initialized(Emitter<State> emit) {
    _subscribeTodoList(emit);
  }

  void _todoTapped(Emitter<State> emit, _TodoTapped event) {}

  void _createTapped(Emitter<State> emit, _CreateTapped event) {
    _push(TodoCreateRoute().location);
  }

  Future<void> _subscribeTodoList(Emitter<State> emit) async {
    await emit.forEach(
      _storage.todoList,
      onData: (todoList) {
        return state.copyWith(todoList: todoList);
      },
    );
  }
}

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.initial() = _Initial;
  const factory HomeEvent.todoTapped(Todo todo) = _TodoTapped;
  const factory HomeEvent.createTapped() = _CreateTapped;
}

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required bool initialized,
    required bool isLoading,
    required List<Todo> todoList,
  }) = _HomeState;

  factory HomeState.initial() =>
      HomeState(initialized: false, isLoading: false, todoList: []);
}
