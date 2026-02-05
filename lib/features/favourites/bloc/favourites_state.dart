part of 'favourites_bloc.dart';

@freezed
sealed class FavouritesState with _$FavouritesState {
  const factory FavouritesState({
    @Default([]) List<CurrencyEntity> currencies,
    @Default(false) bool isLoading,
  }) = _FavouritesState;
}
