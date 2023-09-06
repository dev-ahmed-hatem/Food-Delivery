part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeBannerLoading extends HomeState {}

class HomeBannerSuccess extends HomeState {}

class HomeBannerError extends HomeState {}
