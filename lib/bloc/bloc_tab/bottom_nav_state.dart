part of 'bottom_nav_bloc.dart';

@immutable
sealed class HomeState {}

final class BottomNavInitial extends HomeState {}

final class IndexChangeState extends HomeState {}
