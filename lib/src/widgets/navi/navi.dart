import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/navi_bloc.dart';

export 'router_delegate.dart';
export 'bloc/navi_bloc.dart';

class Navi extends StatelessWidget {
  final Widget child;
  const Navi({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NaviBloc(),
      child: child,
    );
  }
}
