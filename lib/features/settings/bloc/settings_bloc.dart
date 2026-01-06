import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cbu/core/l10n/l10n.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  static const String _themeKey = 'themeMode';
  static const String _localeKey = 'selectedLocale';

  SettingsBloc() : super(const SettingsState()) {
    on<_AppStarted>(_onAppStarted);
    on<_ThemeChanged>(_onThemeChanged);
    on<_LocaleChanged>(_onLocaleChanged);
  }

  Future<void> _onAppStarted(
    _AppStarted event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final isDarkMode = prefs.getBool(_themeKey) ?? false;
    final themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;

    final languageCode = prefs.getString(_localeKey);
    Locale? locale;
    if (languageCode != null) {
      locale = L10n.all.firstWhere(
        (l) => l.languageCode == languageCode,
        orElse: () => L10n.all.first,
      );
    }

    emit(state.copyWith(
      themeMode: themeMode,
      locale: locale,
    ));
  }

  Future<void> _onThemeChanged(
    _ThemeChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, event.themeMode == ThemeMode.dark);
    emit(state.copyWith(themeMode: event.themeMode));
  }

  Future<void> _onLocaleChanged(
    _LocaleChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, event.locale.languageCode);
    emit(state.copyWith(locale: event.locale));
  }
}
