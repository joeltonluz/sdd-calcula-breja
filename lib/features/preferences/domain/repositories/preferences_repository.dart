import 'package:dartz/dartz.dart';

abstract class PreferencesRepository {
  Future<Either<Exception, void>> saveTheme(String theme);
  Future<Either<Exception, String?>> getTheme();
}
