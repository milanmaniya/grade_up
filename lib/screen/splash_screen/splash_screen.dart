import 'package:flutter/material.dart';
import 'package:grade_up/splash_services/splash_services.dart';
import 'package:lottie/lottie.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  SplashServices services = SplashServices();

  @override
  void initState() {
    services.isLogin(context);
    super.initState();
    // animation();
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

  // Future<void> animation() async {
  //   await Future.delayed(
  //     const Duration(
  //       seconds: 6,
  //     ),
  //   );
  //   setState(() {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const WelcomeScreenPage(),
  //       ),
  //     );
  //   });
  // }
}
