import 'package:cbu/core/error/failures.dart';
import 'package:cbu/core/extensions/l10n_extension.dart';
import 'package:cbu/features/exchange/presentation/bloc/currency_bloc.dart';
import 'package:cbu/features/exchange/presentation/cubit/currency_search_cubit.dart';
import 'package:cbu/features/exchange/presentation/widgets/currency_widget.dart';
import 'package:cbu/features/favourites/bloc/favourites_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        final appBarColor =
            Theme.of(context).appBarTheme.foregroundColor ?? Colors.white;

        if (state.isLoading && state.currencyList.isEmpty) {
          return const Center(child: CupertinoActivityIndicator());
        }

        return BlocBuilder<CurrencySearchCubit, CurrencySearchState>(
          builder: (context, searchState) {
            final currencies = searchState.filteredCurrencies;

            if (currencies.isEmpty) {
              if (state.isLoading) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state.failure != null && state.currencyList.isEmpty) {
                final String message;

                if (state.failure is ServerFailure) {
                  message = (state.failure as ServerFailure).message ??
                      context.l10n.server_error;
                } else {
                  message = context.l10n.unknown_error;
                }

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(message),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(appBarColor),
                        ),
                        onPressed: () {
                          context
                              .read<CurrencyBloc>()
                              .add(const CurrencyEvent.fetchRequested());
                        },
                        child: Text(context.l10n.retry),
                      ),
                    ],
                  ),
                );
              }

              return Center(child: Text(context.l10n.no_data));
            }

            return BlocBuilder<FavouritesBloc, FavouritesState>(
              builder: (context, favState) {
                return CustomScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    CupertinoSliverRefreshControl(
                      onRefresh: () async {
                        context.read<CurrencyBloc>().add(
                          const CurrencyEvent.fetchRequested(),
                        );
                      },
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 5),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            if (index.isOdd) {
                              return const Divider();
                            }
                            final itemIndex = index ~/ 2;
                            final currency = currencies[itemIndex];
                            final isFav = favState.currencies
                                .any((e) => e.ccy == currency.ccy);
                            return CurrencyPageCBWidget(
                              currency: currency,
                              isFavourite: isFav,
                            );
                          },
                          childCount: currencies.isEmpty
                              ? 0
                              : currencies.length * 2 - 1,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
