import 'package:cbu/core/error/failures.dart';
import 'package:cbu/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:cbu/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;
  SettingsRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, Unit>> setThemeMode(ThemeMode themeMode) async {
    await localDataSource.setThemeMode(themeMode);
    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> setLocale(Locale locale) async {
    await localDataSource.setLocale(locale);
    return const Right(unit);
  }

  @override
  Future<Either<Failure, Locale?>> getLocale() async {
    final locale = await localDataSource.getLocale();
    return Right(locale);
  }

  @override
  Future<Either<Failure, ThemeMode>> getThemeMode() async {
    final themeMode = await localDataSource.getThemeMode();
    if (themeMode == null) {
      return const Left(ServerFailure());
    }
    return Right(themeMode);
  }
}
