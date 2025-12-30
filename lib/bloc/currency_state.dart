part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();
}

final class CurrencyInitial extends CurrencyState {
  @override
  List<Object> get props => [];
}

class CurrencyLoading extends CurrencyState {
  @override
  List<Object> get props => [];
}

class CurrencyLoaded extends CurrencyState {
  final List<CBModel> currencyList;

  const CurrencyLoaded({required this.currencyList});

  @override
  List<Object> get props => [currencyList];
}

class CurrencyError extends CurrencyState {
  final String errorMessage;

  const CurrencyError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
