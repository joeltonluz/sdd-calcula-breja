import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/data/models/beer_model.dart';

abstract class BeerLocalDataSource {
  Future<void> saveBeers(List<BeerModel> beers);
  Future<List<BeerModel>> getBeers();
}

class BeerLocalDataSourceImpl implements BeerLocalDataSource {
  final SharedPreferences sharedPreferences;

  BeerLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveBeers(List<BeerModel> beers) async {
    final beerList = beers.map((beer) => beer.toJson()).toList();
    await sharedPreferences.setString('beers', json.encode(beerList));
  }

  @override
  Future<List<BeerModel>> getBeers() async {
    final jsonString = sharedPreferences.getString('beers');
    if (jsonString != null) {
      final beerList = json.decode(jsonString) as List;
      return beerList.map((beer) => BeerModel.fromJson(beer)).toList();
    } else {
      return [];
    }
  }
}
