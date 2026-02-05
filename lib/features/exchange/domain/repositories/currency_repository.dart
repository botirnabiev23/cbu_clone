import 'package:cbu/core/error/failures.dart';
import 'package:cbu/features/exchange/domain/entities/currencies_entity.dart';
import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class CurrencyRepository {
  Future<Either<Failure, CurrenciesEntity>> getCurrencies();
  Future<Either<Failure, void>> addFavourite(CurrencyEntity currency);
  Future<Either<Failure, CurrenciesEntity>> getFavourites();
}
