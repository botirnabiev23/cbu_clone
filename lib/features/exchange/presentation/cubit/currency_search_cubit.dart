import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_search_state.dart';
part 'currency_search_cubit.freezed.dart';

class CurrencySearchCubit extends Cubit<CurrencySearchState> {
  CurrencySearchCubit() : super(const CurrencySearchState.initial());

  List<CurrencyEntity> _allCurrencies = [];

  void setInitialList(List<CurrencyEntity> list) {
    _allCurrencies = list;
    emit(CurrencySearchState.success(list));
  }

  void search(String query) {
    if (query.isEmpty) {
      emit(CurrencySearchState.success(_allCurrencies));
      return;
    }

    final filtered = _allCurrencies.where((element) {
      final searchLower = query.toLowerCase();
      return (element.ccy?.toLowerCase().contains(searchLower) ?? false) ||
          (element.ccyNmRU?.toLowerCase().contains(searchLower) ?? false) ||
          (element.ccyNmUZ?.toLowerCase().contains(searchLower) ?? false);
    }).toList();

    emit(CurrencySearchState.success(filtered));
  }
}
