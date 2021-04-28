import 'package:flutter/material.dart';

enum Pages {
  home,
  login,
  settings,
  error,
}

const String HomePath = '/';
const String LoginPath = '/login';
const String SettingsPath = '/settings';
const String ErrorPath = '/error';

const PageConfiguration HomeConfig =
    PageConfiguration('HOME', 'Home', HomePath, Pages.home, Icons.home);
const PageConfiguration LoginConfig =
    PageConfiguration('LOGIN', 'Login', LoginPath, Pages.login, Icons.login);
const PageConfiguration SettingsConfig = PageConfiguration(
    'SETTINGS', 'Settings', SettingsPath, Pages.settings, Icons.settings);
const PageConfiguration ErrorConfig =
    PageConfiguration('ERROR', 'Error', ErrorPath, Pages.error, Icons.login);

// Number of pages not included in the NavDrawer list
const int NumPagesExluded = 2;

const List<PageConfiguration> PageConfigs = [
  HomeConfig,
  LoginConfig,
  SettingsConfig,
  ErrorConfig,
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
