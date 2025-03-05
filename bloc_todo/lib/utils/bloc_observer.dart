// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

class BlocLogObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('🚦 on change: $bloc, $change');
    super.onChange(bloc, change);
  }
}
