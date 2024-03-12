part of 'themes_cubit.dart';

@freezed
class ThemesState with _$ThemesState {
  const factory ThemesState.initial() = _Initial;
  const factory ThemesState.loadedThemeMode(
    ThemeMode themeMode,
  ) = LoadedThemeMode;
}
