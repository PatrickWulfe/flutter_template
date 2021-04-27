import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../views/views.dart';

import '../../navi.dart';

class NaviRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;
  BuildContext? _context;
  NaviState? _naviState;

  NaviRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    _context = context;
    return BlocBuilder<NaviBloc, NaviState>(
      builder: (_context, naviState) {
        _naviState = naviState;
        return Navigator(
          key: _navigatorKey,
          pages: _buildPages(naviState.pageConfig),
          onPopPage: _onPopPage,
        );
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }

  // Helper functions
  List<Page> _buildPages(_) {
    if (_naviState!.pageConfig.key == 'LOGIN') {
      return [MaterialPage(child: LoginPage())];
    }
    return [MaterialPage(child: HomePage())];
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    BlocProvider.of<NaviBloc>(_context!).add(NaviPop(_naviState!.pageConfig));
    return true;
  }
}
