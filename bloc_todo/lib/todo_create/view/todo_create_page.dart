import 'package:bloc_todo/storages/todo_storage.dart';
import 'package:bloc_todo/todo_create/bloc/todo_create_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCreatePage extends StatelessWidget {
  const TodoCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              TodoCreateBloc(TodoStorage())
                ..add(const TodoCreateEvent.initial()),
      child: const TodoCreateView(),
    );
  }
}

class TodoCreateView extends StatelessWidget {
  const TodoCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
