import 'package:basicappforaarya/providers/cartProvider.dart';
import 'package:basicappforaarya/providers/productDetailsProvider.dart';
import 'package:basicappforaarya/providers/productsProvider.dart';
import 'package:basicappforaarya/providers/userProvider.dart';
import 'package:basicappforaarya/riders(widgets)/loading.dart';
import 'package:basicappforaarya/riders(widgets)/productDetails.dart';
import 'package:basicappforaarya/riders(widgets)/shopping.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
        ChangeNotifierProvider(create: (context) => ProductDetailsProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0166FF)),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontSize: 96.0,
                fontWeight: FontWeight.w300,
                letterSpacing: -1.5),
            displayMedium: TextStyle(
                fontSize: 60.0,
                fontWeight: FontWeight.w300,
                letterSpacing: -0.5),
            displaySmall: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.0),
            headlineMedium: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25),
            headlineSmall: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.0),
            titleLarge: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15),
            titleMedium: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.15),
            titleSmall: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1),
            bodyLarge: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5),
            bodyMedium: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25),
            bodySmall: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.4),
            labelLarge: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.25),
            labelSmall: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5),
          ),
        ),
        initialRoute: '/',
        // home: Shopping(),
        // initialRoute: 'Details',
        routes: {
          '/': (context) => const Loading(
                isLoadingSplash: true,
              ),
          'Home': (context) => const Shopping(),
          'Details': (context) => const ProductDetails(),
        },
      ),
    ));
