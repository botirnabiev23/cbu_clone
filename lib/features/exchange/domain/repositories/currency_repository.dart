import 'package:cbu/core/error/failures.dart';
import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class CurrencyRepository {
  Future<Either<Failure, List<CurrencyEntity>>> fetchCurrencies();
  Future<Either<Failure, void>> addFavourite(CurrencyEntity currency);
  Future<Either<Failure, List<CurrencyEntity>>> getFavourites();
}
