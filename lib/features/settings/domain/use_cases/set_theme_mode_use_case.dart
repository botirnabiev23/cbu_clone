import 'package:cbu/core/error/failures.dart';
import 'package:cbu/core/use_cases/use_case.dart';
import 'package:cbu/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetThemeModeUseCase extends UseCase<Unit, ThemeMode> {
  final SettingsRepository repository;

  SetThemeModeUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ThemeMode params) {
    return repository.setThemeMode(params);
  }
}
