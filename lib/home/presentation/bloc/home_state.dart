import 'package:equatable/equatable.dart';
import 'package:test_kulina/home/data/model/home_model.dart';

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
  final HomeModel? banner;
  HomeSuccess(this.banner);

  @override
  String toString() => 'HomeSuccess { banner : $banner }';
}
