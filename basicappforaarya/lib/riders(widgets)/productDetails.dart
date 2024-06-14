import 'package:basicappforaarya/models/prodDetails.dart';
import 'package:basicappforaarya/services/apiServices.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool dataLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final routeSettings = ModalRoute.of(context)?.settings;
    // print(routeSettings);
    if (routeSettings != null && routeSettings.arguments is int) {
      int pid = routeSettings.arguments as int;
      // print(pid);
      loadDetails(pid);
    }
  }

  ProdDetails? prodDetails;

  void loadDetails(int Pid) async {
    ApiService apiService = ApiService();
    ProdDetails res = await apiService.getProductDetails(Pid);
    setState(() {
      dataLoading = true;
      prodDetails = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!dataLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // title: Text(prodDetails?.title ?? 'product Details'),
          bottom: PreferredSize(
            preferredSize: Size.fromRadius(50),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(
                  prodDetails?.title ?? 'product Details',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.shopping_cart),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.favorite_border),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  // topLeft: Radius.circular(0),
                  // topRight: Radius.zero,
                  bottomLeft: Radius.circular(56),
                  bottomRight: Radius.circular(56),
                ),
                child: Image(
                  // height: 390,
                  image: NetworkImage(prodDetails?.image ??
                      'https://images.unsplash.com/photo-1581235720704-06d3acfcb36f?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            prodDetails?.title ?? 'Name of Product',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              prodDetails?.rating.rate.toString() ?? "rate",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              prodDetails?.rating.count.toString() ?? "count",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      prodDetails?.category ?? 'category',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      prodDetails?.description ??
                          'Lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "\$ ${prodDetails?.price.toString() ?? '102.45'}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.shopping_cart_outlined),
                          Text('Add to Cart'),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
