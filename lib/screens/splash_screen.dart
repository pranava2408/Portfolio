import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0;

  var name = "Balla Pranava Chaitanya";

  var display = "";

  void startLoading() async {
    for (double i = 0; i <= 100; i++) {
      await Future.delayed(Duration(milliseconds: 30));
      setState(() {
        progress = i / 100.0;
        int len = (progress * name.length).floor();
        display = name.substring(0, len);
      });
    }
    context.go('/home');
  }
  @override 
  void initState() {
    // TODO: implement initState
    super.initState();
    startLoading();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              display,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                value: progress,
                color: Colors.white,
                backgroundColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
