import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/entities/beer.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/bloc/beer_comparator_bloc.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/bloc/beer_comparator_event.dart';

class BeerForm extends StatefulWidget {
  const BeerForm({super.key});

  @override
  State<BeerForm> createState() => _BeerFormState();
}

class _BeerFormState extends State<BeerForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _volumeController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name/Brand (optional)',
            ),
          ),
          TextFormField(
            controller: _volumeController,
            decoration: const InputDecoration(
              labelText: 'Volume (ml)',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a volume';
              }
              if (int.tryParse(value) == null || int.parse(value) <= 0) {
                return 'Please enter a valid volume';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _priceController,
            decoration: const InputDecoration(
              labelText: 'Price (R\$)',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a price';
              }
              if (double.tryParse(value) == null || double.parse(value) <= 0) {
                return 'Please enter a valid price';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final beer = Beer(
                  name: _nameController.text,
                  volume: int.parse(_volumeController.text),
                  price: double.parse(_priceController.text),
                );
                context.read<BeerComparatorBloc>().add(AddBeerEvent(beer: beer));
                _nameController.clear();
                _volumeController.clear();
                _priceController.clear();
              }
            },
            child: const Text('Add Beer'),
          ),
        ],
      ),
    );
  }
}
