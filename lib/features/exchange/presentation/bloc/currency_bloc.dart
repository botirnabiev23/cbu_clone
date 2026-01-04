import 'dart:async';
import 'package:cbu/core/use_cases/use_case.dart';
import 'package:cbu/features/exchange/data/models/currency_models.dart';
import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:cbu/features/exchange/domain/use_cases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'currency_event.dart';

part 'currency_state.dart';

part 'currency_bloc.freezed.dart';

@injectable
class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final GetCurrency getCurrency;
  CurrencyBloc(this.getCurrency) : super(const CurrencyState.initial()) {
    on<CurrencyEvent>(_loadCurrencyList);
  }

  Future<void> _loadCurrencyList(
    CurrencyEvent event,
    Emitter<CurrencyState> emit,
  ) async {
    emit(const CurrencyState.loading());
    try {
      final result = await getCurrency(NoParams());
      result.fold(
        (failure) =>
            emit(CurrencyState.error(errorMessage: failure.toString())),
        (currencies) => emit(CurrencyState.loaded(currencyList: currencies)),
      );
    } catch (e) {
      emit(CurrencyState.error(errorMessage: e.toString()));
    }
  }
}
