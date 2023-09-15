import 'package:flutter/material.dart';
import 'package:grade_up/common_model/common_card_model.dart';
import 'package:grade_up/common_widget/common_app_bar.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/online_courses_screen/language_course_screen.dart/leacture_screen/youtube_video_screen.dart';

class LeactureScreen extends StatefulWidget {
  const LeactureScreen({super.key, this.index});

  final int? index;

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YoutubePlayerScreen(
                    courseIndex: widget.index,
                    videoIndex: index,
                  ),
                ),
              );
            },
            title: Text('Leacture: $index   ${courseCardList[index].subject}'),
          ),
        ),
      ),
    );
  }
}
