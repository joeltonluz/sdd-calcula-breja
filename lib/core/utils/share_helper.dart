import 'package:share_plus/share_plus.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/domain/entities/beer.dart';

class ShareHelper {
  static void shareComparison(List<Beer> beers) {
    if (beers.isEmpty) {
      return;
    }

    String text = '🍺 Beer Comparison\n\n';
    for (int i = 0; i < beers.length; i++) {
      final beer = beers[i];
      text +=
          '${i + 1}º ${beer.name} ${beer.volume}ml\nR\$ ${beer.price.toStringAsFixed(2)}\nR\$ ${beer.pricePerLiter.toStringAsFixed(2)}/L\n\n';
    }
    text += 'Best cost-benefit:\n${beers.first.name}';

    Share.share(text);
  }
}
