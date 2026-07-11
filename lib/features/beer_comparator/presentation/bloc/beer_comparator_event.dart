import 'package:equatable/equatable.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/entities/beer.dart';

abstract class BeerComparatorEvent extends Equatable {
  const BeerComparatorEvent();

  @override
  List<Object> get props => [];
}

class GetBeersEvent extends BeerComparatorEvent {}

class AddBeerEvent extends BeerComparatorEvent {
  final Beer beer;

  const AddBeerEvent({required this.beer});

  @override
  List<Object> get props => [beer];
}

class DeleteBeerEvent extends BeerComparatorEvent {
  final Beer beer;

  const DeleteBeerEvent({required this.beer});

  @override
  List<Object> get props => [beer];
}

class ClearBeersEvent extends BeerComparatorEvent {}
