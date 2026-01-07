import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:flutter/material.dart';

class CurrencyPageCBWidget extends StatelessWidget {
  final CurrencyEntity currency;

  const CurrencyPageCBWidget({super.key, required this.currency});

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
        trailing: Icon(
          getArrow().icon,
          color: getColor(),
        ),
      ),
    );
  }
}
