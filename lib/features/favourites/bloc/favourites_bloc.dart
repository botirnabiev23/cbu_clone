import 'package:cbu/core/use_cases/use_case.dart';
import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:cbu/features/exchange/domain/use_cases/add_to_favourites_use_case.dart';
import 'package:cbu/features/exchange/domain/use_cases/get_favourites_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';
part 'favourites_bloc.freezed.dart';

@injectable
class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final GetFavouritesUseCase getFavouritesUseCase;
  final AddToFavouritesUseCase addToFavouritesUseCase;

  FavouritesBloc(this.getFavouritesUseCase, this.addToFavouritesUseCase)
      : super(const FavouritesState()) {
    on<_Load>(_onLoadFavorites);
    on<_Add>(_onAddFavourite);
  }

  Future<void> _onLoadFavorites(
    _Load event,
    Emitter<FavouritesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await getFavouritesUseCase.call(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false)),
      (currencies) => emit(
        state.copyWith(
          isLoading: false,
          currencies: currencies,
        ),
      ),
    );
  }

  Future<void> _onAddFavourite(
    _Add event,
    Emitter<FavouritesState> emit,
  ) async {
    await addToFavouritesUseCase.call(event.currency);
    add(const FavouritesEvent.load());
  }
}
