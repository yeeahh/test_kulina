import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  @override
  String toString() => 'HomeInitial';
}

class HomeError extends HomeState {
  @override
  String toString() => 'HomeError';
}

class HomeSuccess extends HomeState {
  @override
  String toString() => 'HomeSuccess';
}

class BannerSuccess extends HomeState {
  @override
  String toString() => 'BannerSuccess';
}
