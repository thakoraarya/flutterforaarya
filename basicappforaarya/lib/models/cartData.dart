import 'package:basicappforaarya/models/prodDetails.dart';

class CartData {
  String date;
  final List<productsInCart> productsListInCart;

  CartData({
    required this.productsListInCart,
    required this.date,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List;
    List<productsInCart> prodCartList =
        productList.map((i) => productsInCart.fromJson(i)).toList();
    return CartData(
      date: json['date'],
      productsListInCart: prodCartList,
    );
  }
}

class productsInCart {
  int productId;
  int quantity;
  ProdDetails? productDetailList;

  productsInCart({
    required this.productId,
    required this.quantity,
    this.productDetailList,
  });

  factory productsInCart.fromJson(Map<String, dynamic> json) {
    return productsInCart(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  @override
  String toString() {
    return 'CartProduct { productId: $productId, quantity: $quantity }';
  }
}
