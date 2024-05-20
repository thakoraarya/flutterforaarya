import 'package:flutter/material.dart';

import '../services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String timee = "loading";

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'india', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    if (mounted) {
      // return;
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    setupWorldTime();
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
