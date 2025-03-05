import 'package:bloc_todo/home/view/home_page.dart';
import 'package:bloc_todo/todo_create/view/todo_create_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  name: 'home',
  path: '/home',
  routes: [
    TypedGoRoute<TodoCreateRoute>(name: 'todoCreate', path: 'todo/create'),
  ],
)
@immutable
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomePage();
  }
}

@immutable
class TodoCreateRoute extends GoRouteData {
  const TodoCreateRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TodoCreatePage();
  }
}
