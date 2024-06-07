import 'package:flutter/material.dart';

import 'pages/choose_location.dart';
import 'pages/home.dart';
import 'pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        'Home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
      },
    ));
