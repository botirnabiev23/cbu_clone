import 'package:cbu/bloc/currency_bloc.dart';
import 'package:cbu/models/models.dart';
import 'package:cbu/request/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  late Future<List<dynamic>> futureRequest;

  Future<void> refreshItems() async {
    final newData = await CBRequest().getRequest();

    setState(() {
      futureRequest = Future.value(newData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        if (state is CurrencyError) {
          return Center(child: Text(state.errorMessage));
        }
        if(state is CurrencyLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CurrencyLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<CurrencyBloc>().add(CurrencyFetchRequested());
              return;
            },
            child: ListView.builder(
              itemCount: state.currencyList.length,
              itemBuilder: (context, index) {
                return CurrencyPageCBWidget(model: state.currencyList[index]);
              },
            ),
          );
        }

        return const Center(child: Text('Нет избранных новостей'));
      },
    );
  }
}

class CurrencyPageCBWidget extends StatelessWidget {
  final CBModel model;

  const CurrencyPageCBWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      double different = double.parse(model.diff!);
      if (different > 0) {
        return Colors.green;
      } else if (different < 0) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    }

    String getPlus() {
      double different = double.parse(model.diff!);
      if (different > 0) {
        return '+${model.diff.toString()}';
      } else if (different < 0) {
        return model.diff.toString();
      } else {
        return model.diff.toString();
      }
    }

    Icon getArrow() {
      double different = double.parse(model.diff!);
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
