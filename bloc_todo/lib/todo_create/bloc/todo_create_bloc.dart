// ignore_for_file: avoid_print

import 'package:bloc_todo/models/todo.dart';
import 'package:bloc_todo/storages/todo_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_create_bloc.freezed.dart';

typedef Event = TodoCreateEvent;
typedef State = TodoCreateState;

class TodoCreateBloc extends Bloc<Event, State> {
  TodoCreateBloc(this._storage) : super(State.initial()) {
    _dispatch();
  }

  final TodoStorage _storage;

  void _dispatch() {
    on<Event>((event, emit) {
      switch (event) {
        case _Initial _:
          _initialized();
        case _DidReceiveTodo e:
          return _didReceiveTodo(emit, e);
        case _CreateTapped _:
          return _createTapped(emit);
        case _Close _:
          return _close(emit);
      }
    });
  }

  Future<void> _initialized() async {
    return;
  }

  Future<void> _didReceiveTodo(
    Emitter<State> emit,
    _DidReceiveTodo event,
  ) async {
    emit(state.copyWith(todo: event.todo));
    return;
  }

  Future<void> _createTapped(Emitter<State> emit) async {
    if (!state.isEnabled || state.isLoading) {
      return;
    }
    emit(state.copyWith(isLoading: true));
    final todo = Todo(todo: state.todo);
    print(todo);
    // TODO: create todo
    emit(state.copyWith(isLoading: false));
    return;
  }

  Future<void> _close(Emitter<State> emit) async {
    return;
  }
}

@freezed
class TodoCreateEvent with _$TodoCreateEvent {
  const factory TodoCreateEvent.initial() = _Initial;
  const factory TodoCreateEvent.createTapped() = _CreateTapped;
  const factory TodoCreateEvent.didReceiveTodo(String todo) = _DidReceiveTodo;
  const factory TodoCreateEvent.close() = _Close;
}

@freezed
abstract class TodoCreateState with _$TodoCreateState {
  const factory TodoCreateState({
    required bool isEnabled,
    required bool isLoading,
    required String todo,
  }) = _TodoCreateState;

  factory TodoCreateState.initial() =>
      TodoCreateState(isEnabled: false, isLoading: false, todo: '');
}
