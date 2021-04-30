import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/core.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      drawer: NavDrawer(),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Second Page'),
          onPressed: () =>
              BlocProvider.of<NaviBloc>(context).add(NaviNavigate(LoginConfig)),
        ),
      ),
    );
  }
}
