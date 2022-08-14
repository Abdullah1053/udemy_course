import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_course/app/app_prefrence.dart';
import 'package:udemy_course/data/network/app_api.dart';
import 'package:udemy_course/data/network/dio_factory.dart';
import 'package:udemy_course/data/network/network_info.dart';
import 'package:udemy_course/data/repository/repository_implementer.dart';
import 'package:udemy_course/domain/repository/repository.dart';
import 'package:udemy_course/domain/usecase/login_usecase.dart';
import 'package:udemy_course/presentaion/login/view_model/login_viewmodel.dart';

import '../data/data_source/remote_dtata_source.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  // its a module where we put all generic dependencies

  //shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  //app prefs instance
  instance
      .registerLazySingleton<AppPrefrences>(() => AppPrefrences(instance()));

  //network info instance
  instance.registerLazySingleton<NetworkingInfo>(
      () => (NetworkingInfoImpl(InternetConnectionChecker())));

//dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();

//App sevices client
  instance
      .registerLazySingleton<AppServicesClient>(() => AppServicesClient(dio));

//remote data source
  instance.registerLazySingleton<ReomteDataSource>(
      () => ReomteDataSourceImpl(instance<AppServicesClient>(), instance()));

//repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
