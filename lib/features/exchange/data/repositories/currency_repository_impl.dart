import 'package:cbu/core/error/failures.dart';
import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:cbu/features/exchange/domain/repositories/currency_repository.dart';
import 'package:cbu/features/exchange/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CurrencyRepository)
class CurrencyRepositoryImpl implements CurrencyRepository {
  final RemoteDataSource remoteDataSource;
  CurrencyRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<Currency>>> fetchCurrencies() async {
    try {
      final result = await remoteDataSource.getRequest();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
