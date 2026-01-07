import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'currency_search_state.dart';
part 'currency_search_cubit.freezed.dart';

@injectable
class CurrencySearchCubit extends Cubit<CurrencySearchState> {
  CurrencySearchCubit() : super(const CurrencySearchState.initial());

  void setInitialList(List<CurrencyEntity> currencies) {
    emit(
      state.copyWith(
        allCurrencies: currencies,
        filteredCurrencies: _applyFilter(
          currencies: currencies,
          query: state.query,
        ),
      ),
    );
  }

  void startSearch() {
    if (state.isSearching) {
      return;
    }
    emit(state.copyWith(isSearching: true));
  }

  void stopSearch() {
    emit(
      state.copyWith(
        isSearching: false,
        query: '',
        filteredCurrencies: state.allCurrencies,
      ),
    );
  }

  void queryChanged(String value) {
    final query = value.trim().toLowerCase();

    emit(
      state.copyWith(
        query: query,
        filteredCurrencies: _applyFilter(
          currencies: state.allCurrencies,
          query: query,
        ),
      ),
    );
  }

  List<CurrencyEntity> _applyFilter({
    required List<CurrencyEntity> currencies,
    required String query,
  }) {
    if (query.isEmpty) {
      return currencies;
    }

    return currencies.where((e) {
      final ccy = (e.ccy ?? '').toLowerCase();
      final ru = (e.ccyNmRU ?? '').toLowerCase();
      final uz = (e.ccyNmUZ ?? '').toLowerCase();

      return ccy.contains(query) || ru.contains(query) || uz.contains(query);
    }).toList();
  }
}
