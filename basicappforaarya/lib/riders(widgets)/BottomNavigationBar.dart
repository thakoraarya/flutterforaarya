import 'package:flutter/material.dart';

class BottomNavigationBar extends StatelessWidget {
  final int CurrentIndex;
  final Function(int) onTap;

  const BottomNavigationBar(
      {super.key,
      required this.CurrentIndex,
      required this.onTap,
      required List<BottomNavigationBarItem> Items});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        CurrentIndex: CurrentIndex,
        onTap: onTap,
        Items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(
              icon: Badge(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'data'),
        ]);
  }
}
