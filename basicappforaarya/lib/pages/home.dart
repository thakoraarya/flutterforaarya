import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    final routeSettings = ModalRoute.of(context)?.settings;
    if (routeSettings != null && routeSettings.arguments is Map) {
      data = routeSettings.arguments as Map;
    }
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Column(
          children: <Widget>[
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Location'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'] ?? 'loading...',
                  style: const TextStyle(
                    fontSize: 28,
                    letterSpacing: 2,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['time'] ?? 'loading...',
                  style: const TextStyle(
                    fontSize: 66,
                    letterSpacing: 2,
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
