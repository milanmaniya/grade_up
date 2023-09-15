import 'package:flutter/material.dart';
import 'package:grade_up/common_widget/common_app_bar.dart';

class LeactureScreen extends StatefulWidget {
  const LeactureScreen({super.key});

  @override
  State<LeactureScreen> createState() => _LeactureScreenState();
}

class _LeactureScreenState extends State<LeactureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: commonAppBar(
          context: context,
          prefixIcon: Icons.arrow_back,
          tagName: 'Leactures',
          fun1: () {
            Navigator.pop(context);
          },
          actionFirstIcon: Icons.favorite,
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          title: Text('Video $index'),
        ),
      ),
    );
  }
}
