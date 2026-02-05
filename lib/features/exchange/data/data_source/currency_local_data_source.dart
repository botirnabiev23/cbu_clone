import 'dart:convert';
import 'package:cbu/core/const/consts.dart';
import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class CurrencyLocalDataSource {
  Future<void> saveCurrencies(List<CurrencyEntity> currencies);
  List<CurrencyEntity> getCachedCurrencies();
  Future<void> saveFavourites(List<CurrencyEntity> currencies);
  List<CurrencyEntity> getFavourites();
}

@LazySingleton(as: CurrencyLocalDataSource)
class CurrencyLocalDataSourceImpl implements CurrencyLocalDataSource {
  final SharedPreferences sharedPreferences;

  CurrencyLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> saveCurrencies(List<CurrencyEntity> currencies) async {
    final List<String> currencyJson =
        currencies.map((currency) => jsonEncode(currency.toJson())).toList();
    await sharedPreferences.setStringList(currenciesKey, currencyJson);
  }

  @override
  List<CurrencyEntity> getCachedCurrencies() {
    final List<String> cachedStrings =
        sharedPreferences.getStringList(currenciesKey) ?? [];
    return cachedStrings
        .map((item) => CurrencyEntity.fromJson(jsonDecode(item)))
        .toList();
  }

  @override
  Future<void> saveFavourites(List<CurrencyEntity> currencies) async {
    final List<String> currencyJson =
        currencies.map((currency) => jsonEncode(currency.toJson())).toList();
    await sharedPreferences.setStringList(favouritesKey, currencyJson);
  }

  @override
  List<CurrencyEntity> getFavourites() {
    final List<String> cachedStrings =
        sharedPreferences.getStringList(favouritesKey) ?? [];
    return cachedStrings
        .map((item) => CurrencyEntity.fromJson(jsonDecode(item)))
        .toList();
  }
}
