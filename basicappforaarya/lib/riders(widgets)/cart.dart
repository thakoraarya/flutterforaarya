import 'package:basicappforaarya/models/cartData.dart';
import 'package:basicappforaarya/services/apiServices.dart';
import 'package:flutter/material.dart';

import '../models/prodDetails.dart';

class cartView extends StatefulWidget {
  const cartView({super.key});

  @override
  State<cartView> createState() => _cartViewState();
}

class _cartViewState extends State<cartView> {
  CartData? _cartProductRes;

  // List<dynamic>? _CartListRes;
  ProdDetails? prodDetails;

  @override
  void initState() {
    LoadCart(1);
    super.initState();
  }

  void LoadCart(int Cid) async {
    ApiService apiService = ApiService();
    CartData cartDataRes = await apiService.getCartData(Cid);
    _cartProductRes = cartDataRes;
    _cartProductRes!.products.map((p) => loadDetails(p.productId));
    print(_cartProductRes.toString());
  }

  Future<dynamic> loadDetails(int Pid) async {
    ApiService apiService = ApiService();
    ProdDetails res = await apiService.getProductDetails(Pid);
    setState(() {
      prodDetails = res;
    });
    print(prodDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Text(_cartProductRes?.date ?? "date not found"),
        ],
      ),
    ));
  }
}
