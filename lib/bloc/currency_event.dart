part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CurrencyLoadList extends CurrencyEvent {
  final List<CBModel> currencyList;

  CurrencyLoadList({required this.currencyList});

  @override
  List<Object?> get props => [currencyList];
}

class CurrencyFetchRequested extends CurrencyEvent {}
