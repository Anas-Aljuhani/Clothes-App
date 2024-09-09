import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int currentIndex = 0;
  HomeBloc() : super(IndexChangeState()) {
    on<HomeEvent>((event, emit) {});

    on<NavigatorBetweenScreenEvent>((event, emit) {
      currentIndex = event.selectedIndex;
      emit(IndexChangeState());
    });
  }
}
