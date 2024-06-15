import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String ImageUrl;
  final String ProductName;
  final String ProductPrice;
  final String ProductRate;
  final String ProductPPL;
  void Function() onClick;

  ListItem({
    Key? key,
    required this.ImageUrl,
    required this.ProductName,
    required this.onClick,
    required this.ProductPrice,
    required this.ProductRate,
    required this.ProductPPL,
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
      onTap: widget.onClick,
      leading: Image(
        width: 50,
        image: NetworkImage(widget.ImageUrl),
      ),
      title: Text(
        widget.ProductName,
        overflow: TextOverflow.ellipsis,
      ),
      titleTextStyle: Theme.of(context).textTheme.titleSmall,
      subtitle: Text('\$ ${widget.ProductPrice}'),
      subtitleTextStyle: Theme.of(context).textTheme.bodySmall,
      // trailing: Checkbox(
      //   onChanged: (newValue) => setState(
      //     () => IsAddedToCart = newValue,
      //   ),
      //   value: IsAddedToCart,
      // ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            widget.ProductRate,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            widget.ProductPPL,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
