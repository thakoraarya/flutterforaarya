import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: const Text('My First App'),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 200,
                width: 200,
              ),
              Container(
                color: Colors.red,
                height: 150,
                width: 150,
              ),
              Container(
                color: Colors.green,
                height: 100,
                width: 100,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (kDebugMode) {
                print("################");
                print("hehe");
                print("################");
              }
            },
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
          )),
    );
  }
}
