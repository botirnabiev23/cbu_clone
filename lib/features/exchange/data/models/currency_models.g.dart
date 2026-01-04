// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      id: (json['id'] as num?)?.toInt(),
      code: json['Code'] as String?,
      ccy: json['Ccy'] as String?,
      ccyNmRU: json['CcyNm_RU'] as String?,
      ccyNmUZ: json['CcyNm_UZ'] as String?,
      ccyNmUZC: json['CcyNm_UZC'] as String?,
      ccyNmEN: json['CcyNm_EN'] as String?,
      nominal: json['Nominal'] as String?,
      rate: json['Rate'] as String?,
      diff: json['Diff'] as String?,
      date: json['Date'] as String?,
    );

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Code': instance.code,
      'Ccy': instance.ccy,
      'CcyNm_RU': instance.ccyNmRU,
      'CcyNm_UZ': instance.ccyNmUZ,
      'CcyNm_UZC': instance.ccyNmUZC,
      'CcyNm_EN': instance.ccyNmEN,
      'Nominal': instance.nominal,
      'Rate': instance.rate,
      'Diff': instance.diff,
      'Date': instance.date,
    };
