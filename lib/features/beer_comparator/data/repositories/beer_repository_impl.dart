import 'package:dartz/dartz.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/data/datasources/beer_local_data_source.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/data/models/beer_model.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/entities/beer.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/repositories/beer_repository.dart';

class BeerRepositoryImpl implements BeerRepository {
  final BeerLocalDataSource localDataSource;

  BeerRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Exception, void>> saveBeers(List<Beer> beers) async {
    try {
      final beerModels = beers
          .map((beer) =>
              BeerModel(name: beer.name, volume: beer.volume, price: beer.price))
          .toList();
      await localDataSource.saveBeers(beerModels);
      return const Right(null);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<Beer>>> getBeers() async {
    try {
      final beerModels = await localDataSource.getBeers();
      final beers = beerModels
          .map((beerModel) => Beer(
              name: beerModel.name,
              volume: beerModel.volume,
              price: beerModel.price))
          .toList();
      return Right(beers);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
