import 'package:basicappforaarya/providers/productsProvider.dart';
import 'package:basicappforaarya/riders(widgets)/listItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductsProvider>(context, listen: false).fetchProducts();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductsProvider>(builder:
          (BuildContext context, ProductsProvider value, Widget? child) {
        if (value.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (value.products!.isEmpty) {
          return Center(
            child: Text('no products'),
          );
        }
        return ListView.separated(
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 8,
          ),
          itemCount: value.products?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            var prods = value.products![index];
            return ListItem(
              onClick: () {
                Navigator.pushNamed(context, 'Details', arguments: prods.id);
              },
              ImageUrl: prods.image ?? 'https://dummyjson.com/image/100',
              ProductName: prods.title ?? 'Data not Found',
              ProductPrice: prods.price ?? 'Data not Found',
              ProductRate: prods.rating?.rate.toString() ?? 'Data not Found',
              ProductPPL: prods.rating?.count.toString() ?? 'Data not Found',
            );
          },
        );
      }),
    );
  }
}
