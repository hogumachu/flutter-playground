import 'package:bloc_todo/app_router/app_router.dart';
import 'package:bloc_todo/storages/todo_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(navigatorKey: GlobalKey<NavigatorState>());
    return MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: TodoStorage.instance)],
      child: MaterialApp.router(routerConfig: appRouter.routes),
    );
  }
}
