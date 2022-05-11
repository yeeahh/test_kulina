import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_kulina/home/data/model/home_model.dart';
import 'package:test_kulina/home/domain/repositories/home_repository.dart';
import 'package:test_kulina/home/presentation/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  HomeRepository? homeRepository;
  HomeModel? data;
  List<Datum>? dataBannerCarousel;
  List<Datum>? dataBannerSpecial;

  void getBannerData() async {
    try {
      this.data = await homeRepository?.fetchBannerData();
      if (data != null) {
        getBannerSpecial();
        emit(HomeSuccess(data));
      } else {
        emit(HomeError());
      }
    } catch (e) {
      emit(HomeError());
    }
  }

  void getBannerSpecial() async {
    data?.data.forEach((item) {
      if (item.name.contains("Small Banner")) {
        dataBannerSpecial?.add(item);
      } else if (item.name.contains("Top Banner 1")) {
        dataBannerCarousel?.add(item);
      }
    });
  }
}
