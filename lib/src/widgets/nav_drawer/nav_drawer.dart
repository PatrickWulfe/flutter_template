import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/widgets/nav_drawer/components/header/header.dart';
import 'package:flutter_template/src/widgets/nav_drawer/components/nav_drawer_list/nav_drawer_list.dart';
import '../widgets.dart';
import 'cubit/nav_drawer_cubit.dart';

export 'cubit/nav_drawer_cubit.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: BlocProvider<NavDrawerCubit>(
      create: (context) => NavDrawerCubit(),
      child: BlocListener<NaviBloc, NaviState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          BlocProvider.of<NavDrawerCubit>(context)
              .updateSelected(state.pageConfig.uiPage);
        },
        child: NavDrawerList(
          header: NavDrawerHeader(),
        ),
      ),
    ));
  }
}
