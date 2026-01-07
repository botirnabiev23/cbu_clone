import 'package:cbu/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract interface class SettingsRepository {
  Future<Either<Failure, Unit>> setThemeMode(ThemeMode themeMode);
  Future<Either<Failure, ThemeMode>> getThemeMode();
  Future<Either<Failure, Unit>> setLocale(Locale locale);
  Future<Either<Failure, Locale?>> getLocale();
}
