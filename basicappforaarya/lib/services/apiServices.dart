import 'dart:convert';

import 'package:basicappforaarya/models/prodDetails.dart';
import 'package:basicappforaarya/models/productList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  Future<List<dynamic>> getProducts() async {
    final url = Uri.parse('$baseUrl/products');
    final response = await http.get(url);
    var res = jsonDecode(response.body);
    if (response.statusCode == 200 && res is List<dynamic>) {
      var products = res.map((item) => ProdList.fromJson(item)).toList();
      // print(products[0].price.toString());
      return products;
    } else {
      debugPrint('no data found');
      return [];
    }
  }

  Future<ProdDetails> getProductDetails(int Pid) async {
    final url = Uri.parse('$baseUrl/products/${Pid}');
    final response = await http.get(url);
    var res = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var details = res;
      return ProdDetails.fromJson(details);
    } else {
      debugPrint('no data found');
      throw Exception('Faild to Load Data');
    }
  }
}
