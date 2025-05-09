import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/repos/home_repo_impl.dart';
import '../service/api_service.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
}
