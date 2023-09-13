import 'package:flutter/material.dart';
import 'package:grade_up/common_widget/common_app_bar.dart';
import 'package:grade_up/common_widget/common_course_card.dart';
import 'package:grade_up/utils/constraint_data.dart';

class LatestCourseScreen extends StatefulWidget {
  const LatestCourseScreen({super.key});

  @override
  State<LatestCourseScreen> createState() => _LatestCourseScreenState();
}

class _LatestCourseScreenState extends State<LatestCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstraintData.bgColor,
      appBar: AppBar(
        bottom: commonSecondAppBar(
          context: context,
          prefixIcon: Icons.arrow_back,
          fun1: () {
            Navigator.pop(context);
          },
          fun2: () {},
          tagName: 'Latest Courses',
          actionFirstIcon: Icons.notifications,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
