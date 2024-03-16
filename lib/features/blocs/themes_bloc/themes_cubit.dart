import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../settings/data/themes_repository/themes_base_repository.dart';

part 'themes_cubit.freezed.dart';
part 'themes_state.dart';

class ThemesCubit extends Cubit<ThemesState> {
  final ThemesBaseRepository _themesRepository;

  ThemesCubit({required ThemesBaseRepository themesRepository})
      : _themesRepository = themesRepository,
        super(const ThemesState.loadedThemeMode(ThemeMode.system)) {
    getTheme();
  }

  void getTheme() async {
    final theme = await _themesRepository.getTheme();
    emit(ThemesState.loadedThemeMode(theme));
  }

  Future<void> setTheme(ThemeMode theme) async {
    await _themesRepository.setTheme(theme);
    emit(ThemesState.loadedThemeMode(theme));
  }

  void toggleTheme() async {
    final theme = state.maybeWhen(
      orElse: () => ThemeMode.system,
      loadedThemeMode: (theme) => theme,
    );

    final newTheme =
        theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await setTheme(newTheme);
  }
}
