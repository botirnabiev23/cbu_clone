import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_entity.freezed.dart';
part 'currency_entity.g.dart';

@freezed
abstract class CurrencyEntity with _$CurrencyEntity {
  const factory CurrencyEntity({
    int? id,
    String? code,
    String? ccy,
    String? ccyNmRU,
    String? ccyNmUZ,
    String? ccyNmUZC,
    String? ccyNmEN,
    String? nominal,
    String? rate,
    String? diff,
    String? date,
  }) = _CurrencyEntity;

  factory CurrencyEntity.fromJson(Map<String, dynamic> json) =>
      _$CurrencyEntityFromJson(json);
}
