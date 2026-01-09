part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.appStarted() = _AppStarted;
  const factory SettingsEvent.themeChanged(ThemeMode themeMode) = _ThemeChanged;
  const factory SettingsEvent.localeChanged(Locale locale) = _LocaleChanged;
}
