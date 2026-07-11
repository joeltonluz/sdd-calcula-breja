import 'package:dartz/dartz.dart';
import 'package:sdd_calcula_breja_flutter/features/preferences/domain/repositories/preferences_repository.dart';

class GetThemeUseCase {
  final PreferencesRepository repository;

  GetThemeUseCase({required this.repository});

  Future<Either<Exception, String?>> call() async {
    return await repository.getTheme();
  }
}
