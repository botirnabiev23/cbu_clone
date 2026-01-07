import 'dart:convert';
import 'package:cbu/core/error/failures.dart';
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
  Future<Either<Failure, List<CurrencyEntity>>> fetchCurrencies() async {
    try {
      final result = await remoteDataSource.getRequest();
      return Right(result);
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

      // Check if already exists by checking 'ccy'
      final int index = favourites.indexWhere((item) {
        final Map<String, dynamic> decoded = jsonDecode(item);
        return decoded['ccy'] == currency.ccy;
      });

      if (index != -1) {
        // Remove if already exists (toggle behavior) or just keep it
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
  Future<Either<Failure, List<CurrencyEntity>>> getFavourites() async {
    try {
      final List<String> favourites =
          sharedPreferences.getStringList(_favouritesKey) ?? [];

      final List<CurrencyEntity> entities = favourites
          .map((item) => CurrencyEntity.fromJson(jsonDecode(item)))
          .toList();

      return Right(entities);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
