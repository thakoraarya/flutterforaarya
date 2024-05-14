import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green[800],
          title: const Text('location'),
        ),
        body: const Text('choose location'));
  }
}
