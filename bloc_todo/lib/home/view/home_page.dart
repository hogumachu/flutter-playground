import 'package:bloc_todo/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              HomeBloc(context.read(), context.push)
                ..add(const HomeEvent.initial()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return _body(context, state);
        },
      ),
      floatingActionButton: _addButton(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(title: Text('할 일 목록'));
  }

  Widget _body(BuildContext context, HomeState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: state.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(state.todoList[index].todo);
            },
          ),
        ),
      ],
    );
  }

  Widget _addButton(BuildContext context) {
    return FilledButton(
      onPressed: () {
        context.read<HomeBloc>().add(HomeEvent.createTapped());
      },
      child: Text('추가하기'),
    );
  }
}
