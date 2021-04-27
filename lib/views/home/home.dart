import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../navi/navi.dart';
import '../../utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Second Page'),
          onPressed: () => BlocProvider.of<NaviBloc>(context)
              .add(NaviNavigate(SecondConfig)),
        ),
      ),
    );
  }
}
