part of 'currency_bloc.dart';

@freezed
abstract class CurrencyState with _$CurrencyState {
  const factory CurrencyState({
    @Default(false) bool isLoading,
    @Default([]) List<CurrencyEntity> currencyList,
    String? errorMessage,
  }) = _CurrencyState;
}
