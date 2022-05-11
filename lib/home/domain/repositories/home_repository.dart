import 'package:test_kulina/home/data/model/home_model.dart';

abstract class HomeRepository {
  Future<HomeModel> fetchBannerData();
}
