import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_kulina/home/data/datasource/remote/home_network.dart';
import 'package:test_kulina/home/data/model/home_model.dart';

class HomeNetworkImpl extends HomeNetwork {
  @override
  Future<HomeModel> getBannerData() async {
    var dio = Dio();
    try {
      Response<String> response =
          await dio.get("http://food.mockable.io/v1/banner");
      return HomeModel.fromJson(jsonDecode(response.data ?? "")['data']);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
