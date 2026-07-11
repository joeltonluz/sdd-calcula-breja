import 'package:dartz/dartz.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/repositories/beer_repository.dart';

class ClearBeersUseCase {
  final BeerRepository repository;

  ClearBeersUseCase({required this.repository});

  Future<Either<Exception, void>> call() async {
    return await repository.saveBeers([]);
  }
}
