import 'package:cbu/core/error/failures.dart';
import 'package:cbu/core/use_cases/use_case.dart';
import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:cbu/features/exchange/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrency extends UseCase<List<Currency>, NoParams> {
  final CurrencyRepository repository;
  GetCurrency(this.repository);

  @override
  Future<Either<Failure, List<Currency>>> call(NoParams params) async {
    return await repository.fetchCurrencies();
  }
}
