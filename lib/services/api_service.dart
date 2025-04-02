// lib/services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:imecehub/models/companies.dart';
import 'package:imecehub/models/products.dart';
import '../models/users.dart';
import '../models/productCategories.dart';
import '../api/api_config.dart'; // Add this line to import ApiConfig

class ApiService {
  /// API'den User verisini çekmek için metot.
  static Future<List<Company>> fetchSellers() async {
    // API konfigürasyon bilgilerini yükle.
    final config = await ApiConfig.loadFromAsset();

    // HTTP GET isteği gönderilirken header'a API key eklenir.
    final response = await http.get(
      Uri.parse(config.companiesApiUrl),
      headers: {
        'X-API-Key': config.apiKey,
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=utf-8',
        'Allow': 'Get',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Company.fromJson(json)).toList();
    } else {
      throw Exception(
          'User verisi alınamadı. Durum kodu: ${response.statusCode}');
    }
  }

  static Future<User> fetchUserId(int? id) async {
    // API konfigürasyon bilgilerini yükle.
    final config = await ApiConfig.loadFromAsset();

    // HTTP GET isteği gönderilirken header'a API key eklenir.
    final response = await http.get(
      Uri.parse('${config.usersApiUrl}$id/'),
      headers: {
        'X-API-Key': config.apiKey,
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=utf-8',
        'Allow': 'Get',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(utf8.decode(response.bodyBytes));
      return User.fromJson(jsonData);
    } else {
      throw Exception(
          'User verisi alınamadı. Durum kodu: ${response.statusCode}');
    }
  }

  /// API'den Product verisini çekmek için metot.
  static Future<List<Product>> fetchProducts({String? id}) async {
    // API konfigürasyon bilgilerini yükle.
    final config = await ApiConfig.loadFromAsset();

    // HTTP GET isteği gönderilirken header'a API key eklenir.
    final response = await http.get(
      Uri.parse(
          id == null ? config.productsApiUrl : '${config.productsApiUrl}$id/'),
      headers: {
        'X-API-Key': config.apiKey,
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData =
          json.decode(utf8.decode(response.bodyBytes));

      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception(
          'Ürünler verisi alınamadı. Durum kodu: ${response.statusCode}');
    }
  }

  static Future<List<Category>> fetchCategories() async {
    // API konfigürasyon bilgilerini yükle.
    final config = await ApiConfig.loadFromAsset();

    // HTTP GET isteği gönderilirken header'a API key eklenir.
    final response = await http.get(
      Uri.parse(config.categoriesApiUrl),
      headers: {
        'X-API-Key': config.apiKey,
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=utf-8',
        'Allow': 'Get',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception(
          'Category verisi alınamadı. Durum kodu: ${response.statusCode}');
    }
  }

  /// API'den Product verisini çekmek için metot.
  static Future<List<Product>> fetchPopulerProducts() async {
    // API konfigürasyon bilgilerini yükle.
    final config = await ApiConfig.loadFromAsset();

    // HTTP GET isteği gönderilirken header'a API key eklenir.
    final response = await http.get(
      Uri.parse(config.populerProductsApiUrl),
      headers: {
        'X-API-Key': config.apiKey,
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData =
          json.decode(utf8.decode(response.bodyBytes));

      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception(
          'Popüler Ürünler verisi alınamadı. Durum kodu: ${response.statusCode}');
    }
  }

  /// API'den Product verisini çekmek için metot.
  static Future<Product> fetchProduct(int? id) async {
    // API konfigürasyon bilgilerini yükle.
    final config = await ApiConfig.loadFromAsset();

    // HTTP GET isteği gönderilirken header'a API key eklenir.
    final response = await http.get(
      Uri.parse('${config.productsApiUrl}$id/'),
      headers: {
        'X-API-Key': config.apiKey,
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(utf8.decode(response.bodyBytes));
      return Product.fromJson(jsonData);
    } else {
      throw Exception(
          'Ürün verisi alınamadı. Durum kodu: ${response.statusCode}');
    }
  }
}
