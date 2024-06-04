import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://dummyjson.com';

  Future<List<dynamic>> getProducts() async {
    final url = Uri.parse('$baseUrl/products');
    final response = await http.get(url);
    var res = jsonDecode(response.body);
    if (response.statusCode == 200 &&
        res is Map<String, dynamic> &&
        res.containsKey('products')) {
      return res['products'];
    } else {
      debugPrint('no data found');
      return [];
    }
  }
}
