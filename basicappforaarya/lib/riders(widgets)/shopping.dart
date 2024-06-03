import 'package:flutter/material.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ,
        centerTitle: true,
        title: Text("Shopping Mall (as per name of page)"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Image(
              image: NetworkImage('https://dummyjson.com/image/150'),
            ),
            title: Text('List Item View'),
            titleTextStyle: Theme.of(context).textTheme.titleSmall,
            trailing:
                // OutlinedButton(onPressed: () {}, child: Text("button"))),
                Checkbox(
              onChanged: (newValue) => setState(
                () => _value = newValue,
              ),
              value: _value,
            ),
          ),
        ],
      ),
      // bottomNavigationBar: ,
    );
  }
}
