import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../models/models.dart';
import '../navi.dart';
import '../../../utils/utils.dart';

part 'navi_event.dart';
part 'navi_state.dart';

class NaviBloc extends Bloc<NaviEvent, NaviState> {
  NaviBloc() : super(ErrorState());

  @override
  Stream<NaviState> mapEventToState(
    NaviEvent event,
  ) async* {
    switch (event.runtimeType) {
      case NaviNavigate:
        yield CurrentPage((event as NaviNavigate).pageConfig, false);
        break;
      case NaviPop:
        if ((event as NaviPop).pageConfig.uiPage == Pages.home) {
          yield CurrentPage(HomeConfig, false);
        } else {
          yield CurrentPage(HomeConfig, true);
        }
        break;
      case NaviErrorEvent:
        yield ErrorState();
        break;
    }
  }
}
