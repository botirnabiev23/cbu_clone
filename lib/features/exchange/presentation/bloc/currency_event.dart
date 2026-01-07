part of 'currency_bloc.dart';

@freezed
sealed class CurrencyEvent with _$CurrencyEvent {
  const factory CurrencyEvent.loadCurrencies(
      {required List<CurrencyModel> currencyList}) = _LoadCurrencies;
  const factory CurrencyEvent.fetchRequested() = _FetchRequested;
}
