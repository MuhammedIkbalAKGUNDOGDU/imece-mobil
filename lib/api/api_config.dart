import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ApiConfig {
  final String usersApiUrl;
  final String productsApiUrl;
  final String productsCategoryApiUrl;
  final String categoriesApiUrl;
  final String populerProductsApiUrl;
  final String companiesApiUrl;
  final String apiKey;

  ApiConfig({
    required this.usersApiUrl,
    required this.apiKey,
    required this.productsApiUrl,
    required this.categoriesApiUrl,
    required this.populerProductsApiUrl,
    required this.companiesApiUrl,
    required this.productsCategoryApiUrl,
  });

  factory ApiConfig.fromJson(Map<String, dynamic> json) {
    return ApiConfig(
      usersApiUrl: json['usersApiUrl'],
      productsApiUrl: json['productsApiUrl'],
      productsCategoryApiUrl: json['productsCategoryApiUrl'],
      categoriesApiUrl: json['categoriesApiUrl'],
      populerProductsApiUrl: json['populerProductsApiUrl'],
      companiesApiUrl: json['companiesApiUrl'],
      apiKey: json['apiKey'],
    );
  }

  /// JSON dosyasını okuyup ApiConfig nesnesi döndüren metot.
  static Future<ApiConfig> loadFromAsset() async {
    final jsonString = await rootBundle.loadString('api/api_config.json');
    final jsonMap = json.decode(jsonString);
    return ApiConfig.fromJson(jsonMap);
  }
}
