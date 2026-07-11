import 'package:dartz/dartz.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/entities/beer.dart';

abstract class BeerRepository {
  Future<Either<Exception, void>> saveBeers(List<Beer> beers);
  Future<Either<Exception, List<Beer>>> getBeers();
}
