import 'package:equatable/equatable.dart';

class Beer extends Equatable {
  final String? name;
  final int volume;
  final double price;

  const Beer({
    this.name,
    required this.volume,
    required this.price,
  });

  double get pricePerLiter => (price / volume) * 1000;

  @override
  List<Object?> get props => [name, volume, price];
}
