import 'package:basicappforaarya/models/prodDetails.dart';
import 'package:basicappforaarya/services/apiServices.dart';
import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier {
  ApiService apiService = ApiService();
  ProdDetails? _pDetails;
  bool _isLoading = false;

  ProdDetails? get pDetails => _pDetails;

  bool get isLoading => _isLoading;

  Future<dynamic> fetchProductDetails(int Pid) async {
    _isLoading = true;
    notifyListeners();
    try {
      _pDetails = await apiService.getProductDetails(Pid);
      print(_pDetails.toString());
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
