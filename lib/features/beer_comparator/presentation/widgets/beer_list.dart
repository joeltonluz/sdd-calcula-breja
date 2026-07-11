import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/bloc/beer_comparator_bloc.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/bloc/beer_comparator_state.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/widgets/beer_list_item.dart';

class BeerList extends StatelessWidget {
  const BeerList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeerComparatorBloc, BeerComparatorState>(
      builder: (context, state) {
        if (state is BeerComparatorLoading) {
          return const CircularProgressIndicator();
        } else if (state is BeerComparatorLoaded) {
          return ListView.builder(
            itemCount: state.beers.length,
            itemBuilder: (context, index) {
              final beer = state.beers[index];
              return BeerListItem(
                beer: beer,
                isBest: index == 0,
              );
            },
          );
        } else if (state is BeerComparatorError) {
          return Text(state.message);
        } else {
          return const Text('Add a beer to start comparing');
        }
      },
    );
  }
}
