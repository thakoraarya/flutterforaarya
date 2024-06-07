import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar(
      {Key? key,
      required int this.currentPageIndex,
      required this.selectedDest})
      : super(key: key);

  int currentPageIndex;
  void Function(int) selectedDest;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   bottomNavigationBar: NavigationBar(
    //     onDestinationSelected: widget.selectedDest,
    //     indicatorColor: Theme.of(context).colorScheme.primary,
    //     selectedIndex: widget.currentPageIndex,
    //     destinations: <Widget>[
    //       NavigationDestination(
    //           icon: Icon(Icons.storefront_outlined),
    //           selectedIcon: Icon(
    //             Icons.storefront_rounded,
    //             color: Theme.of(context).colorScheme.onPrimary,
    //           ),
    //           label: 'Shop'),
    //       NavigationDestination(
    //           icon: Icon(Icons.shopping_cart_outlined),
    //           selectedIcon: Icon(
    //             Icons.shopping_cart_rounded,
    //             color: Theme.of(context).colorScheme.onPrimary,
    //           ),
    //           label: 'Cart'),
    //       NavigationDestination(
    //           icon: Icon(Icons.person_outlined),
    //           selectedIcon: Icon(
    //             Icons.person_rounded,
    //             color: Theme.of(context).colorScheme.onPrimary,
    //           ),
    //           label: 'Profile'),
    //     ],
    //   ),
    // );

    return NavigationBar(
      onDestinationSelected: widget.selectedDest,
      indicatorColor: Theme.of(context).colorScheme.primary,
      selectedIndex: widget.currentPageIndex,
      destinations: <Widget>[
        NavigationDestination(
            tooltip: 'Shop',
            icon: Icon(Icons.storefront_outlined),
            selectedIcon: Icon(
              Icons.storefront_rounded,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: 'Shop'),
        NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(
              Icons.shopping_cart_rounded,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: 'Cart'),
        NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(
              Icons.person_rounded,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: 'Profile'),
      ],
    );
  }
}
