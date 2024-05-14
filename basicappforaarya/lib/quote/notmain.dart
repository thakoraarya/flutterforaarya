import 'package:basicappforaarya/quote/quote_card.dart';
import 'package:flutter/material.dart';

import 'quote.dart';

void main() => runApp(const MaterialApp(home: QuoteList()));

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  _QuoteListState createState() {
    return _QuoteListState();
  }
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(author: 'Oscar Wilde', text: 'Personal Information'),
    Quote(
        author: 'Oscar Wilde',
        text: 'I have nothing to declare except my genius'),
    Quote(
        author: 'Oscar Wilde',
        text: 'The truth is rarely pure and never simple')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Awesome Quotes',
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[500],
      ),
      body: Column(
        children: quotes
            .map((quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                }))
            .toList(),
      ),
    );
  }
}
