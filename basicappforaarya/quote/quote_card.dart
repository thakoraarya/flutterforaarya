import 'package:flutter/material.dart';

import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;

  const QuoteCard({super.key, required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.yellow[200],
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        quote.text,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange[800],
                        ),
                      ),
                      // const SizedBox(height: 6.0),
                      // Text(
                      //   quote.author,
                      //   style: TextStyle(
                      //     fontSize: 14.0,
                      //     fontWeight: FontWeight.w400,
                      //     color: Colors.blue[800],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: () => delete(),
                  color: Colors.red[500], // sets the icon color
                  icon: const Icon(Icons.delete)),
            ])));
  }
}
