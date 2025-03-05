import 'package:bloc_todo/models/todo.dart';
import 'package:bloc_todo/storages/todo_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc.freezed.dart';

typedef Event = HomeEvent;
typedef State = HomeState;

class HomeBloc extends Bloc<Event, State> {
  HomeBloc(this._storage) : super(State.initial()) {
    _dispatch();
  }

  final TodoStorage _storage;

  void _dispatch() {
    on<Event>((event, emit) {
      switch (event) {
        case _Initial _:
          return _initialized(emit);
        case _TodoTapped e:
          return _todoTapped(emit, e);
      }
    });
  }

  Future<void> _initialized(Emitter<State> emit) async {
    emit(state.copyWith(isLoading: true));
    final todoList = await _storage.fetch();
    emit(state.copyWith(isLoading: false, todoList: todoList));
  }

  Future<void> _todoTapped(Emitter<State> emit, _TodoTapped event) async {}
}

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.initial() = _Initial;
  const factory HomeEvent.todoTapped(Todo todo) = _TodoTapped;
}

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required List<Todo> todoList,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(isLoading: false, todoList: []);
}
