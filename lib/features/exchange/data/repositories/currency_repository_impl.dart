import 'dart:convert';
import 'package:cbu/core/error/failures.dart';
import 'package:cbu/features/exchange/domain/entities/currencies_entity.dart';
import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:cbu/features/exchange/domain/repositories/currency_repository.dart';
import 'package:cbu/features/exchange/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: CurrencyRepository)
class CurrencyRepositoryImpl implements CurrencyRepository {
  final RemoteDataSource remoteDataSource;
  final SharedPreferences sharedPreferences;

  static const String _favouritesKey = 'favourite_currencies';

  CurrencyRepositoryImpl(this.remoteDataSource, this.sharedPreferences);

  @override
  Future<Either<Failure, CurrenciesEntity>> fetchCurrencies() async {
    try {
      final result = await remoteDataSource.getRequest();
      final entities = result.map((model) => model.toEntity()).toList();
      return Right(CurrenciesEntity(list: entities));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addFavourite(CurrencyEntity currency) async {
    try {
      final List<String> favourites =
          sharedPreferences.getStringList(_favouritesKey) ?? [];

      final String currencyJson = jsonEncode(currency.toJson());

      final int index = favourites.indexWhere((item) {
        final Map<String, dynamic> decoded = jsonDecode(item);
        return decoded['ccy'] == currency.ccy;
      });

      if (index != -1) {
        favourites.removeAt(index);
      } else {
        favourites.add(currencyJson);
      }

      await sharedPreferences.setStringList(_favouritesKey, favourites);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, CurrenciesEntity>> getFavourites() async {
    try {
      final List<String> favourites =
          sharedPreferences.getStringList(_favouritesKey) ?? [];

      final List<CurrencyEntity> entities = favourites
          .map((item) => CurrencyEntity.fromJson(jsonDecode(item)))
          .toList();

      return Right(CurrenciesEntity(list: entities));
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
