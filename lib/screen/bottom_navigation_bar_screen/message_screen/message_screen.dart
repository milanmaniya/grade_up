import 'package:flutter/material.dart';
import 'package:grade_up/extension/media_query_extension.dart';
import 'package:lottie/lottie.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
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
