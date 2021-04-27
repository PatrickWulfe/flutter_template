import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navi.dart';

class Navi extends BlocProvider<NaviBloc> {
  final Widget child;

  Navi({required this.child})
      : super(
          create: (context) => NaviBloc(),
        );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NaviBloc>(
      create: (BuildContext context) => NaviBloc(),
      child: MaterialApp(
        title: 'Bloc Navigator 2.0 Template',
        home: Router(
          routerDelegate: NaviRouterDelegate(),
        ),
      ),
    );
  }
}
