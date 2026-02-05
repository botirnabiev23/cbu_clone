import 'package:equatable/equatable.dart';
import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';

class CurrenciesEntity extends Equatable {
  final List<CurrencyEntity> currencies;

  const CurrenciesEntity({required this.currencies});

  @override
  List<Object?> get props => [currencies];
}
