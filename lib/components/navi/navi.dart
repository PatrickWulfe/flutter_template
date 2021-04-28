import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/navi_bloc.dart';

export 'router_delegate.dart';
export 'bloc/navi_bloc.dart';

class Navi extends BlocProvider<NaviBloc> {
  final Widget child;
  Navi({required this.child})
      : super(
          child: child,
          create: (BuildContext context) => NaviBloc(),
        );
}
