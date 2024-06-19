import 'package:basicappforaarya/models/cartData.dart';
import 'package:basicappforaarya/models/prodDetails.dart';
import 'package:basicappforaarya/services/apiServices.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  ApiService apiService = ApiService();
  CartData? _cart;
  ProdDetails? _cartProductDetails;
  bool _isLoading = false;
  double _newSubtotal = 0;
  double _newIncleAST = 0;
  double _newFinalTotal = 0;

  double get newSubtotal => _newSubtotal;

  double get newIncleAST => _newIncleAST;

  double get newFinalTotal => _newFinalTotal;

  CartData? get cart => _cart;

  bool get isLoading => _isLoading;

  void concatenateItems() {
    for (var product in _cart!.productsListInCart) {
      _newSubtotal += (product.productDetailList!.price * product.quantity)
          .round()
          .toDouble();
    }
    _newIncleAST = (newSubtotal * (18 / 100)).round().toDouble();
    _newFinalTotal = _newSubtotal + _newIncleAST;
    notifyListeners();
  }

  void subtractItems() {
    for (var product in _cart!.productsListInCart) {
      _newSubtotal -= (product.productDetailList!.price * product.quantity)
          .round()
          .toDouble();
    }
    _newIncleAST = (newSubtotal * (18 / 100)).round().toDouble();
    _newFinalTotal = _newSubtotal + _newIncleAST;
    notifyListeners();
  }

  void updateProductQuantity(int pid, pqty, bool operand) {
    if (pqty > 0 || pqty < 10) {
      var productInCart = _cart?.productsListInCart
          .firstWhere((product) => product.productId == pid);
      if (productInCart != null) {
        productInCart.quantity = pqty;
        notifyListeners();
        if (operand) {
          concatenateItems();
        } else {
          subtractItems();
        }
      }
    } else {
      notifyListeners();
    }
  }

  Future<dynamic> fetchCart() async {
    _isLoading = true;
    notifyListeners();
    try {
      _cart = await apiService.getCartData(1);
      for (var CartProducts in _cart!.productsListInCart) {
        _cartProductDetails =
            await apiService.getProductDetails(CartProducts.productId);
        if (_cartProductDetails != null) {
          CartProducts.productDetailList = _cartProductDetails;
        }
      }
      concatenateItems();
    } catch (e) {
      throw Exception(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
