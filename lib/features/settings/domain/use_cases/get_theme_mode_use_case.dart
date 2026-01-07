import 'package:cbu/core/error/failures.dart';
import 'package:cbu/core/use_cases/use_case.dart';
import 'package:cbu/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetThemeModeUseCase extends UseCase<ThemeMode, NoParams> {
  final SettingsRepository repository;

  GetThemeModeUseCase(this.repository);

  @override
  Future<Either<Failure, ThemeMode>> call(NoParams params) {
    return repository.getThemeMode();
  }
}
