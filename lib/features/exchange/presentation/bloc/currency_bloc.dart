import 'dart:async';
import 'package:cbu/core/error/failures.dart';
import 'package:cbu/core/use_cases/use_case.dart';
import 'package:cbu/features/exchange/data/models/currency_models.dart';
import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:cbu/features/exchange/domain/use_cases/get_currency_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'currency_event.dart';
part 'currency_state.dart';
part 'currency_bloc.freezed.dart';

@injectable
class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final GetCurrencyUseCase getCurrency;
  CurrencyBloc(
    this.getCurrency,
  ) : super(const CurrencyState()) {
    on<_LoadCurrencies>(_onLoadCurrency);
    on<_FetchRequested>(_onFetchRequested);
  }

  Future<void> _onLoadCurrency(
    _LoadCurrencies event,
    Emitter<CurrencyState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await getCurrency(NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          failure: failure,
        ),
      ),
      (entity) => emit(
        state.copyWith(
          isLoading: false,
          currencyList: entity.currencies,
        ),
      ),
    );
  }

  Future<void> _onFetchRequested(
    _FetchRequested event,
    Emitter<CurrencyState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await getCurrency(NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          failure: failure,
        ),
      ),
      (entity) => emit(
        state.copyWith(
          isLoading: false,
          currencyList: entity.currencies,
        ),
      ),
    );
  }
}
