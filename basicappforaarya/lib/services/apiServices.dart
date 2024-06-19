import 'dart:convert';

import 'package:basicappforaarya/models/cartData.dart';
import 'package:basicappforaarya/models/prodDetails.dart';
import 'package:basicappforaarya/models/productList.dart';
import 'package:basicappforaarya/models/userModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  Future<List<ProdList>> getProducts() async {
    final url = Uri.parse('$baseUrl/products');
    final response = await http.get(url);
    var res = jsonDecode(response.body);
    if (response.statusCode == 200 && res is List<dynamic>) {
      var products = res.map((item) => ProdList.fromJson(item)).toList();
      // print(products[0].price.toString());
      return products;
    } else {
      print('no data found');
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
      print('no data found');
      throw Exception('Failed to Load Data');
    }
  }

  Future<CartData> getCartData(int Cid) async {
    final url = Uri.parse('$baseUrl/carts/${Cid}');
    final Response = await http.get(url);
    var resData = jsonDecode(Response.body);
    if (Response.statusCode == 200) {
      return CartData.fromJson(resData);
    } else {
      print('no data found');
      throw Exception('Failed to Load Data');
    }
  }

  Future<dynamic> getUserProfile(int id) async {
    final url = Uri.parse('$baseUrl/users/${id}');
    final response = await http.get(url);
    var res = jsonDecode(response.body);
    if (response.statusCode == 200 && res != null) {
      Map<String, dynamic> details = res;
      return UserModel.fromJson(details);
    } else {
      print('no data found');
      throw Exception('Failed to Load Data');
    }
  }
}
