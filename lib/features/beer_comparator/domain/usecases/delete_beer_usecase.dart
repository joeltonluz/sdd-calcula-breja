import 'package:dartz/dartz.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/entities/beer.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/repositories/beer_repository.dart';

class DeleteBeerUseCase {
  final BeerRepository repository;

  DeleteBeerUseCase({required this.repository});

  Future<Either<Exception, void>> call(List<Beer> beers, Beer beerToDelete) async {
    final newBeers = beers.where((beer) => beer != beerToDelete).toList();
    return await repository.saveBeers(newBeers);
  }
}
