import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key, this.isLoadingSplash = false}) : super(key: key);
  final bool isLoadingSplash;

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    splashTimer();
  }

  void splashTimer() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        ++seconds;
      });
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  int seconds = 0;

  @override
  Widget build(BuildContext context) {
    double imageSize = widget.isLoadingSplash ? 250 : 100;
    Color bg = widget.isLoadingSplash
        ? const Color(0xFFFDFDFD)
        : Colors.black.withOpacity(0.2);

    TextStyle? textColor = widget.isLoadingSplash
        ? Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: Theme.of(context).colorScheme.primary)
        : Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: Theme.of(context).colorScheme.onPrimary);

    return Scaffold(
      backgroundColor: bg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.isLoadingSplash
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image(
                      width: imageSize,
                      height: imageSize,
                      image: NetworkImage(
                          'https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da84a78cdbb5a05a92e6cfd93fe0'),
                    ),
                  )
                : CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Loading... $seconds',
              style: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
