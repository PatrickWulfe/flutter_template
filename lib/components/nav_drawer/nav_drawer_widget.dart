import 'package:flutter/material.dart';
import 'components/components.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: NavDrawerList(),
    );
  }
}
