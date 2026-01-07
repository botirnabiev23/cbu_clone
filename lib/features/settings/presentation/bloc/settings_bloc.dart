import 'package:cbu/core/use_cases/use_case.dart';
import 'package:cbu/features/settings/domain/use_cases/get_locale_use_case.dart';
import 'package:cbu/features/settings/domain/use_cases/get_theme_mode_use_case.dart';
import 'package:cbu/features/settings/domain/use_cases/set_locale_use_case.dart';
import 'package:cbu/features/settings/domain/use_cases/set_theme_mode_use_case.dart';
import 'package:cbu/core/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SetThemeModeUseCase setThemeModeUseCase;
  final GetLocaleUseCase getLocaleUseCase;
  final SetLocaleUseCase setLocaleUseCase;
  final GetThemeModeUseCase getThemeModeUseCase;

  SettingsBloc({
    required this.setThemeModeUseCase,
    required this.getLocaleUseCase,
    required this.setLocaleUseCase,
    required this.getThemeModeUseCase,
  }) : super(const SettingsState()) {
    on<_AppStarted>(_onAppStarted);
    on<_ThemeChanged>(_onThemeChanged);
    on<_LocaleChanged>(_onLocaleChanged);
  }

  Future<void> _onAppStarted(
    _AppStarted event,
    Emitter<SettingsState> emit,
  ) async {
    final themeModeResult = await getThemeModeUseCase.call(NoParams());
    final languageCodeResult = await getLocaleUseCase.call(NoParams());

    final themeMode = themeModeResult.fold(
      (_) => ThemeMode.system,
      (mode) => mode,
    );

    final Locale? languageCode = languageCodeResult.fold(
      (_) => null,
      (code) => code,
    );

    final Locale? locale = (languageCode == null)
        ? null
        : L10n.all.firstWhere(
            (l) => l.languageCode == languageCode,
            orElse: () => L10n.all.first,
          );

    emit(
      state.copyWith(
        themeMode: themeMode,
        locale: locale,
      ),
    );
  }

  Future<void> _onThemeChanged(
    _ThemeChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await setThemeModeUseCase.call(event.themeMode);

    result.fold(
      (failure) {
        emit(state.copyWith());
      },
      (_) {
        emit(state.copyWith(themeMode: event.themeMode));
      },
    );
  }

  Future<void> _onLocaleChanged(
    _LocaleChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await setLocaleUseCase.call(event.locale);

    result.fold(
      (failure) {
        emit(state.copyWith());
      },
      (_) {
        emit(state.copyWith(locale: event.locale));
      },
    );
  }
}
