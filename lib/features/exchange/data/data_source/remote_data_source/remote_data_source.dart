import 'package:cbu/features/exchange/data/models/currency_models.dart';
import 'package:cbu/features/exchange/data/models/quote_models.dart';
import 'package:cbu/features/exchange/domain/entities/currency_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract interface class RemoteDataSource {
  Future<List<Currency>> getRequest();
  Future<List<Quote>> getQuotes();
}

@LazySingleton(as: RemoteDataSource)
class CurrencyRemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;
  CurrencyRemoteDataSourceImpl(this.dio);
  @override
  Future<List<Currency>> getRequest() async {
    final response =
        await dio.get('https://cbu.uz/uzc/arkhiv-kursov-valyut/json/');
    final List<dynamic> json = response.data;
    return json.map((item) => CurrencyModel.fromJson(item).toEntity()).toList();
  }

  @override
  Future<List<Quote>> getQuotes() async {
    final response =
        await dio.get('https://jsonguide.technologychannel.org/quotes.json');
    final List<dynamic> json = response.data;
    return json.map((item) => Quote.fromJson(item)).toList();
  }
}
