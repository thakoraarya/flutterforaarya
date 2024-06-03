import 'package:flutter/material.dart';

import 'pages/form.dart';
import 'pages/loading.dart';
import 'pages/preview.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006600)),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 96.0, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          displayMedium: TextStyle(
              fontSize: 60.0, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          displaySmall: TextStyle(
              fontSize: 48.0, fontWeight: FontWeight.w400, letterSpacing: 0.0),
          headlineMedium: TextStyle(
              fontSize: 34.0, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headlineSmall: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.w400, letterSpacing: 0.0),
          titleLarge: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          titleMedium: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          titleSmall: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyLarge: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyMedium: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          bodySmall: TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          labelLarge: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          labelSmall: TextStyle(
              fontSize: 10.0, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/form': (context) => const FormWithValidation(),
        '/preview': (context) => const UserPreview(),
// '/preview': (context) => const preview(),
      },
    ));
