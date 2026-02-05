import 'package:cbu/features/exchange/presentation/widgets/currency_widget.dart';
import 'package:cbu/features/favourites/bloc/favourites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<FavouritesBloc, FavouritesState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.currencies.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.currencies.length,
                    itemBuilder: (context, index) {
                      final currency = state.currencies[index];
                      final isFav =
                          state.currencies.any((e) => e.ccy == currency.ccy);
                      return CurrencyPageCBWidget(
                        currency: currency,
                        isFavourite: isFav,
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text('No favourite currencies'),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
