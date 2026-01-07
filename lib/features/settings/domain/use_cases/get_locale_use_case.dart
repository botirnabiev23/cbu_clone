import 'package:cbu/core/error/failures.dart';
import 'package:cbu/core/use_cases/use_case.dart';
import 'package:cbu/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLocaleUseCase extends UseCase<Locale?, NoParams> {
  final SettingsRepository repository;

  GetLocaleUseCase(this.repository);

  @override
  Future<Either<Failure, Locale?>> call(NoParams params) {
    return repository.getLocale();
  }
}
