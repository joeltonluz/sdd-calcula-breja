import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdd_calcula_breja_flutter/core/utils/share_helper.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/bloc/beer_comparator_bloc.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/bloc/beer_comparator_event.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/bloc/beer_comparator_state.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/widgets/beer_form.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/widgets/beer_list.dart';
import 'package:sdd_calcula_breja_flutter/features/donation/presentation/pages/donation_page.dart';
import 'package:sdd_calcula_breja_flutter/features/preferences/presentation/bloc/theme_cubit.dart';

class BeerComparatorPage extends StatelessWidget {
  const BeerComparatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beer Comparator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              final state = context.read<BeerComparatorBloc>().state;
              if (state is BeerComparatorLoaded) {
                ShareHelper.shareComparison(state.beers);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<BeerComparatorBloc>().add(ClearBeersEvent());
            },
          ),
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.volunteer_activism),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DonationPage()),
              );
            },
          ),
        ],
      ),
      body: const Column(
        children: [
          BeerForm(),
          Expanded(child: BeerList()),
        ],
      ),
    );
  }
}
