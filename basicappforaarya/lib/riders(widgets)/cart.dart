import 'package:basicappforaarya/riders(widgets)/listItem.dart';
import 'package:basicappforaarya/services/apiServices.dart';
import 'package:flutter/material.dart';

class cartView extends StatefulWidget {
  const cartView({super.key});

  @override
  State<cartView> createState() => _cartViewState();
}

class _cartViewState extends State<cartView> {
  List<dynamic>? _cartProductListRes;

  @override
  void initState() {
    LoadCart();
    super.initState();
  }

  void LoadCart() async {
    ApiService apiService = ApiService();
    List<dynamic> products = await apiService.getProducts();
    setState(() {
      _cartProductListRes = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 8,
        ),
        itemCount: _cartProductListRes?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          var prods = _cartProductListRes![index];
          return ListItem(
            onClick: () {
              print(prods.id);
              Navigator.pushNamed(context, 'Details', arguments: prods.id);
            },
            ImageUrl: prods.image ?? 'https://dummyjson.com/image/100',
            ProductName: prods.title ?? 'Data not Found',
            ProductPrice: prods.price ?? 'Data not Found',
          );
        },
      ),
    );
  }
}
