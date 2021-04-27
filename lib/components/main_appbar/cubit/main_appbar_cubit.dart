import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_appbar_state.dart';

class MainAppbarCubit extends Cubit<MainAppbarState> {
  MainAppbarCubit() : super(MainAppbarInitial());
}
