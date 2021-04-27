import '../../navi/navi.dart';

enum Pages {
  home,
  second,
  error,
}

const String HomePath = '/';
const String SecondPath = '/second';

const PageConfiguration HomeConfig = PageConfiguration('HOME', '/', Pages.home);
const PageConfiguration SecondConfig =
    PageConfiguration('SECOND', '/second', Pages.second);
