import 'package:bloc_todo/app/app.dart';
import 'package:bloc_todo/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void bootstrap() {
  Bloc.observer = BlocLogObserver();

  runApp(App());
}
