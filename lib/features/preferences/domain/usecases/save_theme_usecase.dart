import 'package:dartz/dartz.dart';
import 'package:sdd_calcula_breja_flutter/features/preferences/domain/repositories/preferences_repository.dart';

class SaveThemeUseCase {
  final PreferencesRepository repository;

  SaveThemeUseCase({required this.repository});

  Future<Either<Exception, void>> call(String theme) async {
    return await repository.saveTheme(theme);
  }
}
