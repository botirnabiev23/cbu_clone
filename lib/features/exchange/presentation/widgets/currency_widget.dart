import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:cbu/features/favourites/bloc/favourites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyPageCBWidget extends StatelessWidget {
  final CurrencyEntity currency;
  final bool isFavourite;

  const CurrencyPageCBWidget({
    super.key,
    required this.currency,
    this.isFavourite = false,
  });

  @override
  Widget build(BuildContext context) {
    final double difference = double.tryParse(currency.diff ?? '0') ?? 0;
    final String diffString = currency.diff ?? '0';

    Color getColor() {
      if (difference > 0) {
        return Colors.green;
      } else if (difference < 0) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    }

    String getPlus() {
      if (difference > 0) {
        return '+$diffString';
      } else {
        return diffString;
      }
    }

    Icon getArrow() {
      if (difference > 0) {
        return const Icon(Icons.arrow_upward);
      } else if (difference < 0) {
        return const Icon(Icons.arrow_downward);
      }
      return const Icon(Icons.remove);
    }

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        title: Text(
          '${currency.nominal.toString()} ${currency.ccy} = ${currency.rate}',
          style: const TextStyle(fontSize: 18),
        ),
        subtitle: Text(
          getPlus(),
          style: TextStyle(
            color: getColor(),
            fontSize: 16,
          ),
        ),
        trailing: Row(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              getArrow().icon,
              color: getColor(),
            ),
            IconButton(
              onPressed: () {
                context.read<FavouritesBloc>().add(
                      FavouritesEvent.add(currency),
                    );
              },
              icon: Icon(
                isFavourite ? Icons.star : Icons.star_border,
                color: isFavourite ? Colors.amber : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
