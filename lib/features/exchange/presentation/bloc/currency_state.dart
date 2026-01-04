part of 'currency_bloc.dart';

@freezed
sealed class CurrencyState with _$CurrencyState {
  const factory CurrencyState.initial() = _Initial;
  const factory CurrencyState.loading() = _Loading;
  const factory CurrencyState.loaded({required List<Currency> currencyList}) =
      _Loaded;
  const factory CurrencyState.error({required String errorMessage}) = _Error;
}
