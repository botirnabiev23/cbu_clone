import 'package:cbu/features/exchange/presentation/bloc/currency_bloc.dart';
import 'package:cbu/features/exchange/presentation/cubit/currency_search_cubit.dart';
import 'package:cbu/features/exchange/presentation/widgets/currency_widget.dart';
import 'package:cbu/features/favourites/bloc/favourites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, currencyState) {
        if (currencyState.isLoading && currencyState.currencyList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return BlocBuilder<CurrencySearchCubit, CurrencySearchState>(
          builder: (context, searchState) {
            final currencies = searchState.filteredCurrencies;

            if (currencies.isEmpty) {
              if (currencyState.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              final error = currencyState.failure;
              if (error != null && currencyState.currencyList.isEmpty) {
                return Center(child: Text(error.toString()));
              }

              return const Center(child: Text('No data available'));
            }

            return RefreshIndicator(
              onRefresh: () async {
                context
                    .read<CurrencyBloc>()
                    .add(const CurrencyEvent.fetchRequested());
              },
              child: BlocBuilder<FavouritesBloc, FavouritesState>(
                builder: (context, favState) {
                  return ListView.builder(
                    itemCount: currencies.length,
                    itemBuilder: (context, index) {
                      final currency = currencies[index];
                      final isFav =
                          favState.currencies.any((e) => e.ccy == currency.ccy);
                      return CurrencyPageCBWidget(
                        currency: currency,
                        isFavourite: isFav,
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
