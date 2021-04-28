import 'package:flutter/material.dart';
import '../../components/components.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      drawer: NavDrawer(),
      body: Column(
        children: [
          Text('Settings Page'),
        ],
      ),
    );
  }
}
