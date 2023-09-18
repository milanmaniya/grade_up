import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grade_up/screen/main_screen.dart/main_screen.dart';
import 'package:grade_up/screen/welcome_screen.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      Timer(
        const Duration(seconds: 5),
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        ),
      );
    } else {
      Timer(
        const Duration(seconds: 5),
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreenPage(),
          ),
        ),
      );
    }
  }
}
