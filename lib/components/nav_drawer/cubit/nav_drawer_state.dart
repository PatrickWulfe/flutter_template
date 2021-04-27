part of 'nav_drawer_cubit.dart';

class NavDrawerState extends Equatable {
  Pages selectedPage;
  NavDrawerState(this.selectedPage);

  @override
  List<Object> get props => [selectedPage];
}
