import 'dart:convert';

import 'package:cbu/models/models.dart';
import 'package:http/http.dart' as http;

class CBRepository {
  Future<List<CBModel>> fetchCurrencies() async {
    final response = await http.get(
      Uri.parse('https://cbu.uz/uzc/arkhiv-kursov-valyut/json/'),
    );

    if (response.statusCode != 200) {
      throw Exception('Ошибка загрузки данных');
    }

    final jsonList = jsonDecode(response.body) as List;
    return jsonList.map((e) => CBModel.fromJson(e)).toList();
  }
}