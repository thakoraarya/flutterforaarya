import 'package:basicappforaarya/riders(widgets)/cart.dart';
import 'package:basicappforaarya/riders(widgets)/shop.dart';
import 'package:flutter/material.dart';

import 'BottomNavigationBar.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  int currentIndex = 0;

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
          ShopView(),
          cartView(),
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
