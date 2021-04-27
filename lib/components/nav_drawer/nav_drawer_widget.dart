import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/components/components.dart';
import 'components/components.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<NaviBloc, NaviState>(
        builder: (context, state) {
          return BlocProvider(
            create: (context) => NavDrawerCubit(state.pageConfig.uiPage),
            child: NavDrawerList(),
          );
        },
      ),
    );
  }
}
