import 'dart:convert';
import 'package:lesson_5moonz3/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String _apiKey = "https://dummyjson.com/recipes";

  Future<List<ProductModel>> toCategory() async {
    final response = await http.get(Uri.parse(_apiKey));
    List<ProductModel> forecastList = [];

    if (response.statusCode == 200) {
      final data = json.decode(response.body)["recipes"];

      for (var item in data) {
        ProductModel forecast = ProductModel.fromJson(item);
        forecastList.add(forecast);
      }
    } else {}
    return forecastList;
  }
}
