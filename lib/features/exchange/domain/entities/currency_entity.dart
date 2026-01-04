import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_entity.freezed.dart';

@freezed
abstract class Currency with _$Currency {
  const factory Currency({
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
  }) = _Currency;
}
