import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/components.dart';
import 'components/components.dart';
import 'cubit/settings_page_cubit.dart';

export 'cubit/settings_page_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      drawer: NavDrawer(),
      body: BlocProvider<SettingsPageCubit>(
        create: (context) => SettingsPageCubit(),
        child: Column(
          children: [SettingsPanel()],
        ),
      ),
    );
  }
}
