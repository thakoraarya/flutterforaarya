import 'package:basicappforaarya/services/world_time.dart';
import 'package:flutter/material.dart';

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
      Navigator.pushNamed(context, '/home', arguments: {
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
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(timee),
      ),
    ));
  }
}
