part of 'navi_bloc.dart';

@immutable
abstract class NaviState extends Equatable with ChangeNotifier {
  final PageConfiguration pageConfig;
  final bool popSuccess;

  NaviState(this.pageConfig, this.popSuccess);

  @override
  List<Object> get props => [pageConfig];

  @override
  String toString() => 'CurrentPage { page: ${pageConfig.path} }';
}

class CurrentPage extends NaviState {
  CurrentPage(PageConfiguration pageConfig, bool popSuccess)
      : super(pageConfig, popSuccess);
}

class ErrorState extends NaviState {
  ErrorState() : super(ErrorConfig, false);
}
