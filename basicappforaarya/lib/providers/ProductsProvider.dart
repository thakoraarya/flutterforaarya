import 'package:basicappforaarya/models/cartData.dart';
import 'package:basicappforaarya/models/productList.dart';
import 'package:basicappforaarya/services/apiServices.dart';
import 'package:flutter/material.dart';

class Productsprovider extends ChangeNotifier {
  ApiService apiService = ApiService();
  List<ProdList> _products = [];

  List<ProdList>? get products => _products;

  Future<dynamic> fetchProducts() async {
    try {
      _products = await apiService.getProducts();
      notifyListeners();
    } catch (e) {
      print('Error fetching products: $e');
    }
  }
}
