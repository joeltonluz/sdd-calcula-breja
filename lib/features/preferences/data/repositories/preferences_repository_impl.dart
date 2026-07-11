import 'package:dartz/dartz.dart';
import 'package:sdd_calcula_breja_flutter/features/preferences/data/datasources/preferences_local_data_source.dart';
import 'package:sdd_calcula_breja_flutter/features/preferences/domain/repositories/preferences_repository.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final PreferencesLocalDataSource localDataSource;

  PreferencesRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Exception, void>> saveTheme(String theme) async {
    try {
      await localDataSource.saveTheme(theme);
      return const Right(null);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, String?>> getTheme() async {
    try {
      final theme = await localDataSource.getTheme();
      return Right(theme);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
