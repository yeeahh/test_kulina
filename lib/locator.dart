import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:test_kulina/home/data/datasource/remote/home_network.dart';
import 'package:test_kulina/home/data/datasource/remote/home_network_impl.dart';
import 'package:test_kulina/home/data/repositories/home_repository_impl.dart';
import 'package:test_kulina/home/domain/repositories/home_repository.dart';
import 'package:test_kulina/home/presentation/bloc/home_cubit.dart';

GetIt locator = GetIt.instance;

Future setUpHome() async {
  locator.registerLazySingleton<HomeNetwork>(
    () => HomeNetworkImpl(),
  );
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      homeNetwork: locator(),
    ),
  );

  /// Using factory because [HomeCubit] has a class variable
  /// so modifying it caused confusion when used in another instance using the same Cubit.
  locator.registerFactory<HomeCubit>(
    () => HomeCubit(
      homeRepository: locator<HomeRepository>(),
    ),
  );
}
