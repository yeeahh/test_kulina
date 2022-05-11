import 'package:test_kulina/home/data/datasource/remote/home_network.dart';
import 'package:test_kulina/home/data/model/home_model.dart';
import 'package:test_kulina/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeNetwork homeNetwork;

  HomeRepositoryImpl({required this.homeNetwork});

  @override
  Future<HomeModel> fetchBannerData() async {
    var data = await homeNetwork.getBannerData();
    return data;
  }
}
