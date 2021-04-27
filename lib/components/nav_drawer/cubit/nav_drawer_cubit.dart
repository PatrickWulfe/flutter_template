import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/utils/utils.dart';

part 'nav_drawer_state.dart';

class NavDrawerCubit extends Cubit<NavDrawerState> {
  NavDrawerCubit(Pages currentPage) : super(NavDrawerState(currentPage));

  void updateSelected(Pages page) {
    state.selectedPage = page;
  }
}
