class CartData {
  int id;
  int userId;
  String date;
  List<Product> products;

  CartData({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List;
    List<Product> prodCartList =
        productList.map((i) => Product.fromJson(i)).toList();
    return CartData(
        date: json['date'],
        id: json['id'],
        userId: json['userId'],
        products: prodCartList);
  }
}

class Product {
  int productId;
  int quantity;

  Product({
    required this.productId,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }
}
