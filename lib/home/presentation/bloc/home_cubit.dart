import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_kulina/home/data/model/home_model.dart';
import 'package:test_kulina/home/domain/repositories/home_repository.dart';
import 'package:test_kulina/home/presentation/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit({required this.homeRepository}) : super(HomeInitial());

  HomeModel? data;
  List<Datum> dataBannerCarousel = [];
  List<Datum> dataBannerSpecial = [];

  void getBannerData() async {
    emit(HomeInitial());
    try {
      data = await homeRepository.fetchBannerData();
      if (data != null) {
        getBannerCategory();
        emit(HomeSuccess());
      } else {
        emit(HomeError());
      }
    } catch (e) {
      emit(HomeError());
    }
  }

  void getBannerCategory() {
    emit(HomeInitial());
    for (Datum item in data!.data) {
      if (item.name.contains("Small Banner")) {
        dataBannerSpecial.add(item);
      } else if (item.name.contains("Top Banner")) {
        dataBannerCarousel.add(item);
      }
    }
    emit(BannerSuccess());
  }
}
