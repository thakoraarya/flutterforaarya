import 'package:basicappforaarya/models/productList.dart';
import 'package:basicappforaarya/services/apiServices.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  ApiService apiService = ApiService();
  List<ProdList> _products = [];
  bool _isLoading = false;

  List<ProdList>? get products => _products;

  bool get isLoading => _isLoading;

  Future<dynamic> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _products = await apiService.getProducts();
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
