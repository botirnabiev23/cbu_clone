import 'package:cbu/core/error/failures.dart';
import 'package:cbu/features/exchange/domain/entities/currencies_entity.dart';
import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:cbu/features/exchange/domain/repositories/currency_repository.dart';
import 'package:cbu/features/exchange/data/data_source/currency_remote_data_source.dart';
import 'package:cbu/features/exchange/data/data_source/currency_local_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CurrencyRepository)
class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyRemoteDataSource remoteDataSource;
  final CurrencyLocalDataSource localDataSource;

  CurrencyRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, CurrenciesEntity>> getCurrencies() async {
    try {
      final result = await remoteDataSource.getRequest();
      final entities = result.map((model) => model.toEntity()).toList();
      await localDataSource.saveCurrencies(entities);
      return Right(CurrenciesEntity(currencies: entities));
    } catch (e) {
      final cached = localDataSource.getCachedCurrencies();
      if (cached.isNotEmpty) {
        return Right(CurrenciesEntity(currencies: cached));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addFavourite(CurrencyEntity currency) async {
    try {
      final List<CurrencyEntity> favourites = localDataSource.getFavourites();

      final int index =
          favourites.indexWhere((item) => item.ccy == currency.ccy);

      if (index != -1) {
        favourites.removeAt(index);
      } else {
        favourites.add(currency);
      }

      await localDataSource.saveFavourites(favourites);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, CurrenciesEntity>> getFavourites() async {
    try {
      final List<CurrencyEntity> cachedEntities =
          localDataSource.getFavourites();

      if (cachedEntities.isEmpty) {
        return const Right(CurrenciesEntity(currencies: []));
      }

      try {
        final remoteResult = await remoteDataSource.getRequest();
        final Map<String, CurrencyEntity> freshEntitiesMap = {
          for (var model in remoteResult)
            if (model.ccy != null) model.ccy!: model.toEntity()
        };

        bool hasChanges = false;
        final List<CurrencyEntity> updatedEntities =
            cachedEntities.map((cached) {
          final fresh = freshEntitiesMap[cached.ccy];
          if (fresh != null && fresh != cached) {
            hasChanges = true;
            return fresh;
          }
          return cached;
        }).toList();

        if (hasChanges) {
          await localDataSource.saveFavourites(updatedEntities);
        }

        return Right(CurrenciesEntity(currencies: updatedEntities));
      } catch (_) {
        return Right(CurrenciesEntity(currencies: cachedEntities));
      }
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
