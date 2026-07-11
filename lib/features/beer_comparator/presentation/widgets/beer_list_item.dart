import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/entities/beer.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/bloc/beer_comparator_bloc.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/bloc/beer_comparator_event.dart';

class BeerListItem extends StatelessWidget {
  final Beer beer;
  final bool isBest;

  const BeerListItem({
    super.key,
    required this.beer,
    required this.isBest,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isBest ? Colors.green : null,
      child: ListTile(
        title: Text(beer.name ?? ''),
        subtitle: Text(
            '${beer.volume}ml - R\$${beer.price.toStringAsFixed(2)} - R\$${beer.pricePerLiter.toStringAsFixed(2)}/L'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            context.read<BeerComparatorBloc>().add(DeleteBeerEvent(beer: beer));
          },
        ),
      ),
    );
  }
}
