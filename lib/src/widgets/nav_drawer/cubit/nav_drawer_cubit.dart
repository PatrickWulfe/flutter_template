import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/core.dart';

part 'nav_drawer_state.dart';

class NavDrawerCubit extends Cubit<NavDrawerState> {
  NavDrawerCubit() : super(NavDrawerState(Pages.home));

  void updateSelected(Pages page) {
    emit(NavDrawerState(page));
  }
}
