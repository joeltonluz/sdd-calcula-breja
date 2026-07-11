import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdd_calcula_breja_flutter/features/preferences/domain/usecases/get_theme_usecase.dart';
import 'package:sdd_calcula_breja_flutter/features/preferences/domain/usecases/save_theme_usecase.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final GetThemeUseCase getThemeUseCase;
  final SaveThemeUseCase saveThemeUseCase;

  ThemeCubit({
    required this.getThemeUseCase,
    required this.saveThemeUseCase,
  }) : super(ThemeMode.system);

  Future<void> getTheme() async {
    final result = await getThemeUseCase();
    result.fold(
      (failure) => emit(ThemeMode.system),
      (theme) {
        if (theme == 'dark') {
          emit(ThemeMode.dark);
        } else {
          emit(ThemeMode.light);
        }
      },
    );
  }

  Future<void> toggleTheme() async {
    if (state == ThemeMode.light) {
      await saveThemeUseCase('dark');
      emit(ThemeMode.dark);
    } else {
      await saveThemeUseCase('light');
      emit(ThemeMode.light);
    }
  }
}
