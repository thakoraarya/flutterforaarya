import 'package:basicappforaarya/providers/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/prodDetails.dart';

class cartView extends StatefulWidget {
  const cartView({super.key});

  @override
  State<cartView> createState() => _cartViewState();
}

class _cartViewState extends State<cartView> {
  List<dynamic>? cartProducts;
  ProdDetails? prodDetails;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchCart();
    });
    super.initState();
  }

  void fetchCart() {
    Provider.of<CartProvider>(context, listen: false).fetchCart();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double subTotal = Provider.of<CartProvider>(context).newSubtotal;
    double inclAST = Provider.of<CartProvider>(context).newIncleAST;
    double finalTotal = Provider.of<CartProvider>(context).newFinalTotal;
    return Scaffold(body: Consumer<CartProvider>(
        builder: (BuildContext context, CartProvider value, Widget? child) {
      if (value.isLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (!value.isLoading && value.cart == null) {
        return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            ' ¯\\_(ツ)_/¯',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Theme.of(context).colorScheme.error),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'No data available!',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
        ]));
      } else if (value.cart != null && value.cart!.productsListInCart.isEmpty) {
        return Center(
          child: Text('Cart is empty!'),
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart!.productsListInCart.length,
                itemBuilder: (context, index) {
                  var dataList = value.cart!.productsListInCart[index];
                  int productQuantity = dataList.quantity;
                  return ListTile(
                    title: Text(
                      dataList.productDetailList!.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      '\$ ${dataList.productDetailList?.price}',
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
                            onPressed: () {
                              if (productQuantity > 0) {
                                --productQuantity;
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .updateProductQuantity(dataList.productId,
                                        productQuantity, false);
                              }
                            },
                            icon: Icon(Icons.remove),
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                          Text(productQuantity.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiaryContainer)),
                          IconButton(
                              onPressed: () {
                                if (productQuantity < 10) {
                                  ++productQuantity;
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .updateProductQuantity(dataList.productId,
                                          productQuantity, true);
                                }
                              },
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
        );
      }
    }));
  }
}
