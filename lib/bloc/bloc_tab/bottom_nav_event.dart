part of 'bottom_nav_bloc.dart';

@immutable
sealed class HomeEvent {}

class NavigatorBetweenScreenEvent extends HomeEvent{
  final int selectedIndex;

  NavigatorBetweenScreenEvent({required this.selectedIndex});
}
