part of 'navi_bloc.dart';

@immutable
abstract class NaviEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NaviNavigate extends NaviEvent {
  final PageConfiguration pageConfig;
  NaviNavigate(this.pageConfig);

  @override
  String toString() => 'NavigateTo { page: ${pageConfig.path} }';
}

class NaviPop extends NaviEvent {
  final PageConfiguration pageConfig;
  NaviPop(this.pageConfig);

  @override
  String toString() => 'NaviPop { page: ${pageConfig.key} ';
}

class NaviErrorEvent extends NaviEvent {
  NaviErrorEvent() : super();
}
