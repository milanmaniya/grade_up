import 'package:flutter/material.dart';
import 'package:grade_up/common_widget/common_course_card.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              commonCourseCard(
                subjectName: 'General Math',
                totalClass: '8',
                totalLeacture: '4',
                icon: Icons.favorite,
                fun: () {},
                context: context,
                imageUrl: 'assets/general_math.jpg',
              ),
              commonCourseCard(
                subjectName: 'General Math',
                totalClass: '8',
                totalLeacture: '4',
                icon: Icons.favorite,
                fun: () {},
                context: context,
                imageUrl: 'assets/physics.jpg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
