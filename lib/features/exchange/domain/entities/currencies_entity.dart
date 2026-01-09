import 'package:equatable/equatable.dart';
import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';

class CurrenciesEntity extends Equatable {
  final List<CurrencyEntity> list;

  const CurrenciesEntity({required this.list});

  @override
  List<Object?> get props => [list];
}
