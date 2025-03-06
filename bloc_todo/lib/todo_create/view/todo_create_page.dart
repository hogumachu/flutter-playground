import 'package:bloc_todo/todo_create/bloc/todo_create_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TodoCreatePage extends StatelessWidget {
  const TodoCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              TodoCreateBloc(context.read(), context.pop)
                ..add(const TodoCreateEvent.initial()),
      child: const TodoCreateView(),
    );
  }
}

class TodoCreateView extends StatefulWidget {
  const TodoCreateView({super.key});

  @override
  State<TodoCreateView> createState() => _TodoCreateViewState();
}

class _TodoCreateViewState extends State<TodoCreateView> {
  final textController = TextEditingController();

  @override
  void initState() {
    textController.addListener(() {
      context.read<TodoCreateBloc>().add(
        TodoCreateEvent.didReceiveTodo(textController.text),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: BlocBuilder<TodoCreateBloc, TodoCreateState>(
        builder: (context, state) {
          return _body(context, state);
        },
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(title: Text('할 일 추가'));
  }

  Widget _body(BuildContext context, TodoCreateState state) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 8,
        children: [
          TextField(controller: textController),
          ElevatedButton(
            onPressed:
                state.isEnabled
                    ? () {
                      context.read<TodoCreateBloc>().add(
                        TodoCreateEvent.createTapped(),
                      );
                    }
                    : null,
            child: Text('추가하기'),
          ),
        ],
      ),
    );
  }
}
