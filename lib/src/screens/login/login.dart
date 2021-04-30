import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/core.dart';
import '../../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      drawer: NavDrawer(),
      body: Center(
        child: ElevatedButton(
          child: Text('Pop to Home'),
          onPressed: () {
            BlocProvider.of<NaviBloc>(context).add(NaviPop(LoginConfig));
          },
        ),
      ),
    );
  }
}
