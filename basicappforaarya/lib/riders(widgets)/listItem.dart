import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String ImageUrl;
  final String ProductName;

  const ListItem({
    Key? key,
    required this.ImageUrl,
    required this.ProductName,
  }) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool? IsAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    // bool? _value = IsAddedToCart;
    return ListTile(
      leading: Image(
        image: NetworkImage(widget.ImageUrl),
      ),
      title: Text(widget.ProductName),
      titleTextStyle: Theme.of(context).textTheme.titleSmall,
      trailing: Checkbox(
        onChanged: (newValue) => setState(
          () => IsAddedToCart = newValue,
        ),
        value: IsAddedToCart,
      ),
    );
  }
}
