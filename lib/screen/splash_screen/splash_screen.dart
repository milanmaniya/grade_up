import 'package:flutter/material.dart';
import 'package:grade_up/screen/welcome_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    animation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'json/animation.json',
          animate: true,
          repeat: true,
          filterQuality: FilterQuality.high,
          reverse: true,
        ),
      ),
    );
  }

  Future<void> animation() async {
    await Future.delayed(
      const Duration(
        seconds: 6,
      ),
    );
    setState(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreenPage(),
        ),
      );
    });
  }
}
