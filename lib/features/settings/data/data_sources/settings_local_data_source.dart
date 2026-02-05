import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class SettingsLocalDataSource {
  Future<void> setThemeMode(ThemeMode themeMode);
  Future<void> setLocale(Locale locale);
  Future<ThemeMode?> getThemeMode();
  Future<Locale?> getLocale();
}

@LazySingleton(as: SettingsLocalDataSource)
class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences sharedPreferences;
  SettingsLocalDataSourceImpl(this.sharedPreferences);

  static const String _themeKey = 'themeMode';
  static const String _localeKey = 'selectedLocale';

  @override
  Future<void> setThemeMode(ThemeMode themeMode) async {
    await sharedPreferences.setBool(_themeKey, themeMode == ThemeMode.dark);
  }

  @override
  Future<void> setLocale(Locale locale) async {
    await sharedPreferences.setString(_localeKey, locale.languageCode);
  }

  @override
  Future<ThemeMode?> getThemeMode() async {
    final isDarkMode = sharedPreferences.getBool(_themeKey) ?? false;
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Future<Locale?> getLocale() async {
    final languageCode = sharedPreferences.getString(_localeKey);
    return languageCode != null ? Locale(languageCode) : null;
  }
}
