import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/components/components.dart';
import 'package:flutter_template/core/theme/theme.dart';
import 'components/components.dart';
import 'cubit/nav_drawer_cubit.dart';

export 'cubit/nav_drawer_cubit.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // BlocBuilder to create the cubit based on current Navi
      child: BlocBuilder<NaviBloc, NaviState>(
        builder: (context, state) {
          // BlocProvider to provide state to everything downstream in the widget
          return BlocProvider<NavDrawerCubit>(
            create: (context) => NavDrawerCubit(state.pageConfig.uiPage),
            child: NavDrawerList(
              themeCubit: BlocProvider.of<ThemeCubit>(context),
              header: NavDrawerHeader(),
            ),
          );
        },
      ),
    );
  }
}
