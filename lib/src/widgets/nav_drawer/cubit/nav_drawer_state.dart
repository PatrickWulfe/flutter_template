part of 'nav_drawer_cubit.dart';

class NavDrawerState extends Equatable {
  final Pages selectedPage;
  NavDrawerState(this.selectedPage);

  @override
  List<Object> get props => [selectedPage];
}
