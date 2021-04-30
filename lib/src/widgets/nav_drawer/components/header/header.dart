import 'package:flutter/material.dart';

class NavDrawerHeader extends DrawerHeader {
  Widget? child;

  NavDrawerHeader({Key? key}) : super(key: key, child: Text('oops')) {
    child = _buildHeader();
  }

  Widget _buildHeader() {
    return Center(
      child: Text('Header Widget'),
    );
  }
}
