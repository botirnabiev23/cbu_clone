import 'package:cbu/features/exchange/data/models/currency_models.dart';
import 'package:cbu/features/exchange/data/models/quote_models.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract interface class CurrencyRemoteDataSource {
  Future<List<CurrencyModel>> getRequest();
  Future<List<Quote>> getQuotes();
}

@LazySingleton(as: CurrencyRemoteDataSource)
class CurrencyRemoteDataSourceImpl implements CurrencyRemoteDataSource {
  final Dio dio;
  CurrencyRemoteDataSourceImpl(this.dio);
  @override
  Future<List<CurrencyModel>> getRequest() async {
    final response =
        await dio.get('https://cbu.uz/uzc/arkhiv-kursov-valyut/json/');
    final List<dynamic> json = response.data;
    return json.map((item) => CurrencyModel.fromJson(item)).toList();
  }

  @override
  Future<List<Quote>> getQuotes() async {
    final response =
        await dio.get('https://jsonguide.technologychannel.org/quotes.json');
    final List<dynamic> json = response.data;
    return json.map((item) => Quote.fromJson(item)).toList();
  }
}
