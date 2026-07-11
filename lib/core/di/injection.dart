import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/data/datasources/beer_local_data_source.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/data/repositories/beer_repository_impl.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/repositories/beer_repository.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/usecases/clear_beers_usecase.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/usecases/delete_beer_usecase.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/usecases/get_beers_usecase.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/usecases/save_beer_usecase.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/bloc/beer_comparator_bloc.dart';
import 'package:sdd_calcula_breja_flutter/features/preferences/data/datasources/preferences_local_data_source.dart';
import 'package:sdd_calcula_breja_flutter/features/preferences/data/repositories/preferences_repository_impl.dart';
import 'package:sdd_calcula_breja_flutter/features/preferences/domain/repositories/preferences_repository.dart';
import 'package:sdd_calcula_breja_flutter/features/preferences/domain/usecases/get_theme_usecase.dart';
import 'package:sdd_calcula_breja_flutter/features/preferences/domain/usecases/save_theme_usecase.dart';
import 'package:sdd_calcula_breja_flutter/features/preferences/presentation/bloc/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(() => ThemeCubit(getThemeUseCase: sl(), saveThemeUseCase: sl()));
  sl.registerFactory(() => BeerComparatorBloc(
      getBeersUseCase: sl(),
      saveBeerUseCase: sl(),
      deleteBeerUseCase: sl(),
      clearBeersUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetThemeUseCase(repository: sl()));
  sl.registerLazySingleton(() => SaveThemeUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetBeersUseCase(repository: sl()));
  sl.registerLazySingleton(() => SaveBeerUseCase(repository: sl()));
  sl.registerLazySingleton(() => DeleteBeerUseCase(repository: sl()));
  sl.registerLazySingleton(() => ClearBeersUseCase(repository: sl()));

  // Repositories
  sl.registerLazySingleton<PreferencesRepository>(
      () => PreferencesRepositoryImpl(localDataSource: sl()));
  sl.registerLazySingleton<BeerRepository>(
      () => BeerRepositoryImpl(localDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<PreferencesLocalDataSource>(
      () => PreferencesLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<BeerLocalDataSource>(
      () => BeerLocalDataSourceImpl(sharedPreferences: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
