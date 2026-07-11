import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/usecases/clear_beers_usecase.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/usecases/delete_beer_usecase.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/usecases/get_beers_usecase.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/usecases/save_beer_usecase.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/bloc/beer_comparator_event.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/bloc/beer_comparator_state.dart';

class BeerComparatorBloc
    extends Bloc<BeerComparatorEvent, BeerComparatorState> {
  final GetBeersUseCase getBeersUseCase;
  final SaveBeerUseCase saveBeerUseCase;
  final DeleteBeerUseCase deleteBeerUseCase;
  final ClearBeersUseCase clearBeersUseCase;

  BeerComparatorBloc({
    required this.getBeersUseCase,
    required this.saveBeerUseCase,
    required this.deleteBeerUseCase,
    required this.clearBeersUseCase,
  }) : super(BeerComparatorInitial()) {
    on<GetBeersEvent>((event, emit) async {
      emit(BeerComparatorLoading());
      final result = await getBeersUseCase();
      result.fold(
        (failure) => emit(const BeerComparatorError(message: 'Failed to get beers')),
        (beers) {
          beers.sort((a, b) => a.pricePerLiter.compareTo(b.pricePerLiter));
          emit(BeerComparatorLoaded(beers: beers));
        },
      );
    });

    on<AddBeerEvent>((event, emit) async {
      final currentState = state;
      if (currentState is BeerComparatorLoaded) {
        final newBeers = List<
            dynamic>.from(currentState.beers.map((e) => e).toList());
        newBeers.add(event.beer);
        final result = await saveBeerUseCase(newBeers.cast());
        result.fold(
          (failure) => emit(const BeerComparatorError(message: 'Failed to add beer')),
          (_) {
            newBeers.sort((a, b) => a.pricePerLiter.compareTo(b.pricePerLiter));
            emit(BeerComparatorLoaded(beers: newBeers.cast()));
          },
        );
      }
    });

    on<DeleteBeerEvent>((event, emit) async {
      final currentState = state;
      if (currentState is BeerComparatorLoaded) {
        final result =
            await deleteBeerUseCase(currentState.beers, event.beer);
        result.fold(
          (failure) => emit(const BeerComparatorError(message: 'Failed to delete beer')),
          (_) {
            final newBeers = currentState.beers
                .where((beer) => beer != event.beer)
                .toList();
            newBeers.sort((a, b) => a.pricePerLiter.compareTo(b.pricePerLiter));
            emit(BeerComparatorLoaded(beers: newBeers));
          },
        );
      }
    });

    on<ClearBeersEvent>((event, emit) async {
      final result = await clearBeersUseCase();
      result.fold(
        (failure) => emit(const BeerComparatorError(message: 'Failed to clear beers')),
        (_) => emit(const BeerComparatorLoaded(beers: [])),
      );
    });
  }
}
