import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopease/core/network/mock_api_helper.dart';

import '../../features/data/datasources/remote_data_source.dart';
import '../../features/data/datasources/shared_preference.dart';
import '../../features/data/repositories/repository_impl.dart';
import '../../features/domain/repositories/repository.dart';
import '../../features/presentation/bloc/auth/auth_bloc.dart';
import '../../utils/device_info.dart';
import '../network/api_helper.dart';
import '../network/network_info.dart';

final injection = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  injection.registerLazySingleton(() => sharedPreferences);
  injection.registerSingleton(AppSharedData(injection()));
  final packageInfo = await PackageInfo.fromPlatform();

  injection.registerSingleton(DeviceInfo());
  injection.registerSingleton(Dio());
  injection.registerLazySingleton<APIHelper>(
    () => APIHelper(
      dio: injection(),
      appSharedData: injection(),
      packageInfo: packageInfo,
    ),
  );
  injection.registerLazySingleton<MockAPIHelper>(() => MockAPIHelper());
  injection
      .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injection()));
  injection.registerLazySingleton(() => Connectivity());

  ///Data sources
  injection.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      apiHelper: injection(),
      appSharedData: injection(),
      mockAPIHelper: injection(),
    ),
  );

  ///Repository
  injection.registerLazySingleton<Repository>(
    () =>
        RepositoryImpl(remoteDataSource: injection(), networkInfo: injection()),
  );

  ///Blocs
  injection.registerFactory(
    () => AuthBloc(
      appSharedData: injection(),
      repository: injection(),
      deviceInfo: injection(),
    ),
  );
}
