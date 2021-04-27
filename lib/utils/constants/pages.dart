import 'package:flutter/material.dart';

import '../../models/models.dart';

enum Pages {
  home,
  login,
  error,
}

const String HomePath = '/';
const String LoginPath = '/login';
const String ErrorPath = '/error';

const PageConfiguration HomeConfig =
    PageConfiguration('HOME', 'Home', HomePath, Pages.home, Icons.home);
const PageConfiguration LoginConfig =
    PageConfiguration('LOGIN', 'Login', LoginPath, Pages.login, Icons.login);
const PageConfiguration ErrorConfig =
    PageConfiguration('ERROR', 'Error', ErrorPath, Pages.error, Icons.login);

const List<PageConfiguration> PageConfigs = [
  HomeConfig,
  LoginConfig,
];

class PageConfiguration {
  final String key;
  final String name;
  final String path;
  final Pages uiPage;
  final IconData icon;

  const PageConfiguration(
      this.key, this.name, this.path, this.uiPage, this.icon);
}
