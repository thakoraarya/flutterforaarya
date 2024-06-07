import 'package:basicappforaarya/services/apiServices.dart';
import 'package:flutter/material.dart';
import 'BottomNavigationBar.dart';
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
    setState(() {
      _ProductListRes = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    // String? currentPageName = ModalRoute.of(context)!.settings.name;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Shopping App'),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          ListView.separated(
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 8,
            ),
            itemCount: _ProductListRes?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              var prods = _ProductListRes![index];
              return ListItem(
                onClick: () {
                  print(prods.id);
                  // Navigator.pushNamed(context, 'productDetails');
                },
                ImageUrl: prods.image ?? 'https://dummyjson.com/image/100',
                ProductName: prods.title ?? 'Data not Found',
                ProductPrice: prods.price ?? 'Data not Found',
              );
            },
          ),
          Container(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          Container(
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
        ],
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentPageIndex: currentIndex,
        selectedDest: (int index) {
          setState(() {
            currentIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
