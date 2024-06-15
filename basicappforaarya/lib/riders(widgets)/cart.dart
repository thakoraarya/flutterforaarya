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
  CartData? _cartRes;
  List<dynamic>? cartProducts;
  double? subTotal = 0.0;
  double? inclAST = 0.0;
  double? finalTotal = 0.0;

  // List<dynamic>? _CartListRes;
  ProdDetails? prodDetails;

  @override
  void initState() {
    LoadCart(1);
    super.initState();
  }

  @override
  // TODO: implement mounted
  bool get mounted => super.mounted;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // load cart api response
  void LoadCart(int Cid) async {
    ApiService apiService = ApiService();
    CartData cartDataRes = await apiService.getCartData(Cid);
    if (mounted) {
      setState(() {
        _cartRes = cartDataRes;
      });
    }
    // if cart has more than 0 products get product details and store all in 'cartProducts'
    if (_cartRes?.products != null) {
      cartProducts = [];
      for (var product in _cartRes!.products) {
        var prodRes = await loadDetails(product.productId);
        if (mounted) {
          setState(() {
            cartProducts!.add(prodRes);
          });
        }
      }
      subTotal = cartProducts!
          .map((product) => product.price.toDouble())
          .reduce((value, element) => value + element);
      inclAST = double.parse((subTotal! * (18 / 100)).toStringAsFixed(2));
      finalTotal = double.parse(
          (subTotal! + (subTotal! * (18 / 100))).toStringAsFixed(2));
    } else {
      throw Exception(cartDataRes);
    }
  }

  // load product details from cart product id
  Future<dynamic> loadDetails(int Pid) async {
    ApiService apiService = ApiService();
    ProdDetails res = await apiService.getProductDetails(Pid);
    if (mounted) {
      setState(() {
        prodDetails = res;
      });
    }
    return prodDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts?.length ?? 0,
              itemBuilder: (context, index) {
                var data = cartProducts![index];
                return ListTile(
                  title: Text(
                    data.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    '\$ ${data.price.toString()}',
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.remove),
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                        Text('${_cartRes?.products[index].quantity}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                            color: Theme.of(context).colorScheme.onTertiary)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: Text(
              'Subtotal',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            trailing: Text(
              '\$ ${subTotal.toString()}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          ListTile(
            title: Text(
              'Incl. AST',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            trailing: Text(
              '\$ ${inclAST.toString()}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          ListTile(
            tileColor: Theme.of(context).colorScheme.primaryContainer,
            contentPadding: EdgeInsets.all(16),
            title: Text(
              'You have to pay',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            trailing: Text(
              '\$ ${finalTotal.toString()}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ],
      ),
    );
  }
}
