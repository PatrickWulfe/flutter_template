import 'package:flutter/material.dart';
import 'cubit/theme_cubit.dart';

export 'cubit/theme_cubit.dart';

enum AppTheme {
  BlueDark,
  BlueLight,
  GreenDark,
  GreenLight,
  PurpleDark,
  PurpleLight,
}

final appThemeData = {
  AppTheme.BlueDark: ThemeData(
    brightness: dark,
    primaryColor: blue,
  ),
  AppTheme.BlueLight: ThemeData(
    brightness: light,
    primaryColor: blue,
  ),
  AppTheme.GreenDark: ThemeData(
    brightness: dark,
    primaryColor: green,
  ),
  AppTheme.GreenLight: ThemeData(
    brightness: light,
    primaryColor: green,
  ),
  AppTheme.PurpleDark: ThemeData(
    brightness: dark,
    primaryColor: purple,
  ),
  AppTheme.PurpleLight: ThemeData(
    brightness: light,
    primaryColor: purple,
  ),
};

// Constants to make changes to themes easier
// Light vs dark themes
const light = Brightness.light;
const dark = Brightness.dark;

// Primary colors
const blue = Colors.blue;
const green = Colors.green;
const purple = Colors.purple;
