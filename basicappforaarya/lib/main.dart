import 'package:basicappforaarya/pages/choose_location.dart';
import 'package:basicappforaarya/pages/home.dart';
import 'package:basicappforaarya/pages/loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
      },
    ));
