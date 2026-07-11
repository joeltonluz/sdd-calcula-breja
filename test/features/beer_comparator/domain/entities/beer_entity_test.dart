import 'package:flutter_test/flutter_test.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/entities/beer.dart';

void main() {
  group('Beer', () {
    test('pricePerLiter should be calculated correctly', () {
      const beer = Beer(name: 'Test', volume: 500, price: 5);
      expect(beer.pricePerLiter, 10);
    });

    test('beers should be sorted correctly by pricePerLiter', () {
      final beer1 = const Beer(name: 'Test1', volume: 500, price: 5);
      final beer2 = const Beer(name: 'Test2', volume: 600, price: 5);
      final beer3 = const Beer(name: 'Test3', volume: 500, price: 6);
      final beers = [beer3, beer1, beer2];
      beers.sort((a, b) => a.pricePerLiter.compareTo(b.pricePerLiter));
      expect(beers, [beer2, beer1, beer3]);
    });
  });
}
