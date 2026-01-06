import 'package:cbu/features/exchange/presentation/bloc/currency_bloc.dart';
import 'package:cbu/features/exchange/presentation/cubit/currency_search_cubit.dart';
import 'package:cbu/features/exchange/presentation/widgets/currency_widget.dart';
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
            return searchState.maybeWhen(
              success: (currencies) {
                if (currencies.isEmpty) {
                  return const Center(child: Text('No data available'));
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    context
                        .read<CurrencyBloc>()
                        .add(const CurrencyEvent.fetchRequested());
                  },
                  child: ListView.builder(
                    itemCount: currencies.length,
                    itemBuilder: (context, index) {
                      return CurrencyPageCBWidget(model: currencies[index]);
                    },
                  ),
                );
              },
              orElse: () {
                if (currencyState.currencyList.isNotEmpty) {
                  return ListView.builder(
                    itemCount: currencyState.currencyList.length,
                    itemBuilder: (context, index) {
                      return CurrencyPageCBWidget(
                        model: currencyState.currencyList[index],
                      );
                    },
                  );
                }
                final error = currencyState.errorMessage;
                return Center(child: Text(error ?? 'Error'));
              },
            );
          },
        );
      },
    );
  }
}
