import 'package:basicappforaarya/riders(widgets)/listItem.dart';
import 'package:basicappforaarya/services/apiServices.dart';
import 'package:flutter/material.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  List<dynamic>? _shopProductListRes;

  @override
  void initState() {
    LoadShop();
    super.initState();
  }

  void LoadShop() async {
    ApiService apiService = ApiService();
    List<dynamic> products = await apiService.getProducts();
    setState(() {
      _shopProductListRes = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 8,
        ),
        itemCount: _shopProductListRes?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          var prods = _shopProductListRes![index];
          return ListItem(
            onClick: () {
              // print(prods.id);
              Navigator.pushNamed(context, 'Details', arguments: prods.id);
            },
            ImageUrl: prods.image ?? 'https://dummyjson.com/image/100',
            ProductName: prods.title ?? 'Data not Found',
            ProductPrice: prods.price ?? 'Data not Found',
            ProductRate: prods.rating?.rate.toString() ?? 'Data not Found',
            ProductPPL: prods.rating?.count.toString() ?? 'Data not Found',
          );
        },
      ),
    );
  }
}
