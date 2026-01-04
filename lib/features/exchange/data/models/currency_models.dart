import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/currency_entity.dart';

part 'currency_models.g.dart';

@JsonSerializable()
class CurrencyModel {
  final int? id;

  @JsonKey(name: 'Code')
  final String? code;

  @JsonKey(name: 'Ccy')
  final String? ccy;

  @JsonKey(name: 'CcyNm_RU')
  final String? ccyNmRU;

  @JsonKey(name: 'CcyNm_UZ')
  final String? ccyNmUZ;

  @JsonKey(name: 'CcyNm_UZC')
  final String? ccyNmUZC;

  @JsonKey(name: 'CcyNm_EN')
  final String? ccyNmEN;

  @JsonKey(name: 'Nominal')
  final String? nominal;

  @JsonKey(name: 'Rate')
  final String? rate;

  @JsonKey(name: 'Diff')
  final String? diff;

  @JsonKey(name: 'Date')
  final String? date;

  const CurrencyModel({
    this.id,
    this.code,
    this.ccy,
    this.ccyNmRU,
    this.ccyNmUZ,
    this.ccyNmUZC,
    this.ccyNmEN,
    this.nominal,
    this.rate,
    this.diff,
    this.date,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);

  Currency toEntity() => Currency(
        id: id,
        code: code,
        ccy: ccy,
        ccyNmRU: ccyNmRU,
        ccyNmUZ: ccyNmUZ,
        ccyNmUZC: ccyNmUZC,
        ccyNmEN: ccyNmEN,
        nominal: nominal,
        rate: rate,
        diff: diff,
        date: date,
      );
}
