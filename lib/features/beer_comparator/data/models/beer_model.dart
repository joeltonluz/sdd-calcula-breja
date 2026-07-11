import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/entities/beer.dart';

class BeerModel extends Beer {
  const BeerModel({
    super.name,
    required super.volume,
    required super.price,
  });

  factory BeerModel.fromJson(Map<String, dynamic> json) {
    return BeerModel(
      name: json['name'],
      volume: json['volume'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'volume': volume,
      'price': price,
    };
  }
}
