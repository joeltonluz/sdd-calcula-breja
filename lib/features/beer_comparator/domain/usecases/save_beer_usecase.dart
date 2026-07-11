import 'package:dartz/dartz.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/entities/beer.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/repositories/beer_repository.dart';

class SaveBeerUseCase {
  final BeerRepository repository;

  SaveBeerUseCase({required this.repository});

  Future<Either<Exception, void>> call(List<Beer> beers) async {
    return await repository.saveBeers(beers);
  }
}
