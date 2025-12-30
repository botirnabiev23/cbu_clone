import 'dart:async';
import 'dart:convert';

import 'package:cbu/models/models.dart';
import 'package:cbu/repository/currency_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'currency_event.dart';

part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CBRepository cbRepository;
  CurrencyBloc(this.cbRepository) : super(CurrencyInitial()) {
    on<CurrencyEvent>(_loadCurrencyList);
  }

  Future<void> _loadCurrencyList(
    CurrencyEvent event,
    Emitter<CurrencyState> emit,
  ) async {
    emit(CurrencyLoading());
    try {
      final currencyList = await cbRepository.fetchCurrencies();
      emit(CurrencyLoaded(currencyList: currencyList));
    } catch (e) {
      emit(CurrencyError(errorMessage: e.toString()));
    }
  }
}
