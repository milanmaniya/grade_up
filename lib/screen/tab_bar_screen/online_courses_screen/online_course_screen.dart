import 'package:flutter/material.dart';
import 'package:grade_up/common_widget/common_course_card.dart';
import 'package:grade_up/common_widget/common_course_tag.dart';
import 'package:grade_up/screen/tab_bar_screen/online_courses_screen/latest_courses_screen.dart';

class OnlineCourseScreen extends StatefulWidget {
  const OnlineCourseScreen({super.key});

  @override
  State<OnlineCourseScreen> createState() => _OnlineCourseScreenState();
}

class _OnlineCourseScreenState extends State<OnlineCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonCourseTag(
              tagName: 'Latest Courses',
              buttonName: 'See More',
              fun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LatestCourseScreen(),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                commonCourseCard(
                  imageUrl: 'assets/general_math.jpg',
                  subjectName: 'General Math',
                  totalLeacture: '5',
                  totalClass: '9-10',
                  fun: () {},
                  icon: Icons.favorite,
                  context: context,
                ),
                commonCourseCard(
                  imageUrl: 'assets/general_math.jpg',
                  subjectName: 'General Math',
                  totalLeacture: '5',
                  totalClass: '9-10',
                  fun: () {},
                  icon: Icons.favorite,
                  context: context,
                ),
              ],
            ),
            commonCourseTag(
              tagName: 'Best Seller Courses',
              buttonName: 'See More',
              fun: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                commonCourseCard(
                  imageUrl: 'assets/general_math.jpg',
                  subjectName: 'General Math',
                  totalLeacture: '5',
                  totalClass: '9-10',
                  fun: () {},
                  icon: Icons.favorite,
                  context: context,
                ),
                commonCourseCard(
                  imageUrl: 'assets/general_math.jpg',
                  subjectName: 'General Math',
                  totalLeacture: '5',
                  totalClass: '9-10',
                  fun: () {},
                  icon: Icons.favorite,
                  context: context,
                ),
              ],
            ),
            commonCourseTag(
              tagName: 'Most Popular Courses',
              buttonName: 'See More',
              fun: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                commonCourseCard(
                  imageUrl: 'assets/general_math.jpg',
                  subjectName: 'General Math',
                  totalLeacture: '5',
                  totalClass: '9-10',
                  fun: () {},
                  icon: Icons.favorite,
                  context: context,
                ),
                commonCourseCard(
                  imageUrl: 'assets/general_math.jpg',
                  subjectName: 'General Math',
                  totalLeacture: '5',
                  totalClass: '9-10',
                  fun: () {},
                  icon: Icons.favorite,
                  context: context,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
