import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/theme/theme.dart';
import 'package:flutter_template/logic/logic.dart';

import 'simple_bloc_observer.dart';
import 'components/components.dart';
import 'logic/logic.dart';

part 'app.dart';

void main(List<String> args) {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}
