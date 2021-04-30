import 'package:flutter/material.dart';
import 'cubit/main_appbar_cubit.dart';

export 'cubit/main_appbar_cubit.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Flutter Template'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
