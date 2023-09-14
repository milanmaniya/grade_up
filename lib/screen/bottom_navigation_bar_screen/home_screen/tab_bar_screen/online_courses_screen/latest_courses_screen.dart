import 'package:flutter/material.dart';
import 'package:grade_up/common_model/common_card_model.dart';
import 'package:grade_up/common_widget/common_app_bar.dart';
import 'package:grade_up/common_widget/common_course_card.dart';
import 'package:grade_up/utils/constraint_data.dart';

class LatestCourseScreen extends StatefulWidget {
  const LatestCourseScreen({super.key});

  @override
  State<LatestCourseScreen> createState() => _LatestCourseScreenState();
}

class _LatestCourseScreenState extends State<LatestCourseScreen> {
  List<bool> isFavourite = List.generate(6, (index) => false);

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
      body: Align(
        alignment: Alignment.topCenter,
        child: Wrap(
          runSpacing: 10,
          spacing: 5,
          children: List.generate(
            courseCardList.length,
            (index) => commonCourseCard(
              isFavourite: isFavourite[index],
              fun: () {
                if (isFavourite[index]) {
                  isFavourite[index] = !isFavourite[index];
                } else {
                  isFavourite[index] = !isFavourite[index];
                }
                setState(() {});
              },
              imageUrl: courseCardList[index].image,
              subjectName: courseCardList[index].subject,
              totalLeacture: courseCardList[index].totalleacture,
              icon: Icons.favorite,
              context: context,
            ),
          ),
        ),
      ),
    );
  }
}
