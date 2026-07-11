import 'package:dartz/dartz.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/entities/beer.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/repositories/beer_repository.dart';

class GetBeersUseCase {
  final BeerRepository repository;

  GetBeersUseCase({required this.repository});

  Future<Either<Exception, List<Beer>>> call() async {
    return await repository.getBeers();
  }
}
