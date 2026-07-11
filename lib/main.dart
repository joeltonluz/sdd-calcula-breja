import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdd_calcula_breja_flutter/core/di/injection.dart' as di;
import 'package:sdd_calcula_breja_flutter/core/theme/app_theme.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/bloc/beer_comparator_bloc.dart';
import 'package:sdd_calcula_breja_flutter/features/beer_comparator/presentation/pages/beer_comparator_page.dart';
import 'package:sdd_calcula_breja_flutter/features/preferences/presentation/bloc/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<ThemeCubit>()..getTheme(),
        ),
        BlocProvider(
          create: (_) => di.sl<BeerComparatorBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Beer Comparator',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            home: const BeerComparatorPage(),
          );
        },
      ),
    );
  }
}
