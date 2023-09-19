import 'package:flutter/material.dart';
import 'package:grade_up/extension/media_query_extension.dart';
import 'package:lottie/lottie.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'json/future_development.json',
        repeat: true,
        reverse: true,
        height: context.screenHeight * 0.3,
      ),
    );
  }
}
