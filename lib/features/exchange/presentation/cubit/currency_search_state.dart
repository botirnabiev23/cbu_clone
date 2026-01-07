part of 'currency_search_cubit.dart';

@freezed
abstract class CurrencySearchState with _$CurrencySearchState {
  const factory CurrencySearchState.initial({
    @Default(<CurrencyEntity>[]) List<CurrencyEntity> allCurrencies,
    @Default(<CurrencyEntity>[]) List<CurrencyEntity> filteredCurrencies,
    @Default('') String query,
    @Default(false) bool isSearching,
    @Default(0) int currentIndex,
  }) = _Initial;
}
