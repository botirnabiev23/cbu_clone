import 'package:cbu/core/error/failures.dart';
import 'package:cbu/core/use_cases/use_case.dart';
import 'package:cbu/features/exchange/domain/entities/currencies_entity.dart';
import 'package:cbu/features/exchange/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrencyUseCase extends UseCase<CurrenciesEntity, NoParams> {
  final CurrencyRepository repository;
  GetCurrencyUseCase(this.repository);

  @override
  Future<Either<Failure, CurrenciesEntity>> call(NoParams _) async =>
      await repository.getCurrencies();
}
