import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../navi/navi.dart';
import '../../utils/utils.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Pop to Home'),
          onPressed: () {
            BlocProvider.of<NaviBloc>(context).add(NaviPop(SecondConfig));
          },
        ),
      ),
    );
  }
}
