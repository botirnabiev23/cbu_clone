import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:flutter/material.dart';

class CurrencyPageCBWidget extends StatelessWidget {
  final CurrencyEntity model;

  const CurrencyPageCBWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final double different = double.tryParse(model.diff ?? '0') ?? 0;
    final String diffString = model.diff ?? '0';

    Color getColor() {
      if (different > 0) {
        return Colors.green;
      } else if (different < 0) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    }

    String getPlus() {
      if (different > 0) {
        return '+$diffString';
      } else {
        return diffString;
      }
    }

    Icon getArrow() {
      if (different > 0) {
        return const Icon(Icons.arrow_upward);
      } else if (different < 0) {
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
          '${model.nominal.toString()} ${model.ccy} = ${model.rate}',
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
