import 'package:flutter/material.dart';
import 'package:grade_up/common_widget/common_course_tag.dart';

class OnlineCourseScreen extends StatefulWidget {
  const OnlineCourseScreen({super.key});

  @override
  State<OnlineCourseScreen> createState() => _OnlineCourseScreenState();
}

class _OnlineCourseScreenState extends State<OnlineCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          commonCourseTag(
            tagName: 'Latest Courses',
            buttonName: 'See More',
            fun: () {},
          ),
          
        ],
      ),
    );
  }
}
