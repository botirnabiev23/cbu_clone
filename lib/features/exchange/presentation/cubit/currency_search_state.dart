part of 'currency_search_cubit.dart';

@freezed
class CurrencySearchState with _$CurrencySearchState {
  const factory CurrencySearchState.initial() = _Initial;
  const factory CurrencySearchState.success(List<CurrencyEntity> currencies) =
      _Success;
}
