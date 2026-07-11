import 'package:equatable/equatable.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/entities/beer.dart';

abstract class BeerComparatorState extends Equatable {
  const BeerComparatorState();

  @override
  List<Object> get props => [];
}

class BeerComparatorInitial extends BeerComparatorState {}

class BeerComparatorLoading extends BeerComparatorState {}

class BeerComparatorLoaded extends BeerComparatorState {
  final List<Beer> beers;

  const BeerComparatorLoaded({required this.beers});

  @override
  List<Object> get props => [beers];
}

class BeerComparatorError extends BeerComparatorState {
  final String message;

  const BeerComparatorError({required this.message});

  @override
  List<Object> get props => [message];
}
