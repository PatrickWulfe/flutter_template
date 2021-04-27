import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './simple_bloc_observer.dart';

import 'navi/navi.dart';
import 'views/views.dart';

void main(List<String> args) {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navi(
      child: Scaffold(),
    );
  }
}
