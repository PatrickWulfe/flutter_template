import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/utils/utils.dart';

part 'nav_drawer_state.dart';

class NavDrawerCubit extends Cubit<NavDrawerState> {
  NavDrawerCubit() : super(NavDrawerState(Pages.home));

  void updateSelected(Pages page) {
    state.selectedPage = page;
  }
}
