import 'package:basicappforaarya/pages/loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFCF09)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        // '/form': (context) => const InputForm(),
        // '/preview': (context) => const Preview(),
      },
    ));
