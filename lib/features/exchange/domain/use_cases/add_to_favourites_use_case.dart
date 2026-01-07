import 'package:cbu/core/error/failures.dart';
import 'package:cbu/core/use_cases/use_case.dart';
import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:cbu/features/exchange/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddToFavouritesUseCase extends UseCase<void, CurrencyEntity> {
  final CurrencyRepository repository;

  AddToFavouritesUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CurrencyEntity params) async {
    return await repository.addFavourite(params);
  }
}
