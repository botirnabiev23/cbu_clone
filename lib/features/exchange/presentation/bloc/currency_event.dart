part of 'currency_bloc.dart';

@freezed
sealed class CurrencyEvent with _$CurrencyEvent {
  const factory CurrencyEvent.loadList(
      {required List<CurrencyModel> currencyList}) = _Load;
  const factory CurrencyEvent.fetchRequested() = _FetchRequested;
}
