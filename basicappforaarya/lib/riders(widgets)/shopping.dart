import 'package:basicappforaarya/services/apiServices.dart';
import 'package:flutter/material.dart';

import 'listItem.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  List<dynamic>? _ProductListRes;
  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    LoadProducts();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void LoadProducts() async {
    ApiService apiService = ApiService();
    List<dynamic> products = await apiService.getProducts();
    debugPrint(products.toString());
    setState(() {
      _ProductListRes = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Name of Page"),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: [
            ListView(
              children: _ProductListRes != null
                  ? _ProductListRes!.map<Widget>((product) {
                      return ListItem(
                        ImageUrl: product['thumbnail'] ??
                            'https://dummyjson.com/image/100',
                        ProductName: product['title'] ?? 'Data not Found',
                      );
                    }).toList()
                  : [],
            ),
            ListView(
              children: _ProductListRes != null
                  ? _ProductListRes!.map<Widget>((product) {
                      return ListItem(
                        ImageUrl: product['thumbnail'] ??
                            'https://dummyjson.com/image/100',
                        ProductName: product['title'] ?? 'Data not Found',
                      );
                    }).toList()
                  : [],
            ),
            Container(
              color: Colors.black12,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
          ],
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: Duration(microseconds: 350), curve: Curves.easeOut);
          },
          currentIndex: currentIndex,
        )
        // bottomNavigationBar: ,
        );
  }
}
