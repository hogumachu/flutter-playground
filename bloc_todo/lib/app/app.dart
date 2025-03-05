import 'package:bloc_todo/app_router/app_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(navigatorKey: GlobalKey<NavigatorState>());
    return MaterialApp.router(routerConfig: appRouter.routes);
  }
}
