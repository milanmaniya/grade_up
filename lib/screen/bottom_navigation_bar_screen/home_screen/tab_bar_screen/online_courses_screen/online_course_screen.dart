import 'package:flutter/material.dart';
import 'package:grade_up/common_model/common_card_model.dart';
import 'package:grade_up/common_widget/common_course_card.dart';
import 'package:grade_up/common_widget/common_course_tag.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/online_courses_screen/latest_courses_screen.dart';

class OnlineCourseScreen extends StatefulWidget {
  const OnlineCourseScreen({super.key});

  @override
  State<OnlineCourseScreen> createState() => _OnlineCourseScreenState();
}

class _OnlineCourseScreenState extends State<OnlineCourseScreen> {
  // bool isFavourite = false;

  List<bool> isFavourite = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                isFavourite: isFavourite[0],
                fun: () {
                  if (isFavourite[0]) {
                    isFavourite[0] = !isFavourite[0];
                  } else {
                    isFavourite[0] = !isFavourite[0];
                  }
                  setState(() {});
                },
                imageUrl: courseCardList[0].image,
                subjectName: courseCardList[0].subject,
                totalLeacture: courseCardList[0].totalleacture,
                totalClass: courseCardList[0].totalclass,
                icon: Icons.favorite,
                context: context,
              ),
              commonCourseCard(
                isFavourite: isFavourite[1],
                fun: () {
                  if (isFavourite[1]) {
                    isFavourite[1] = !isFavourite[1];
                  } else {
                    isFavourite[1] = !isFavourite[1];
                  }
                  setState(() {});
                },
                imageUrl: courseCardList[0].image,
                subjectName: courseCardList[0].subject,
                totalLeacture: courseCardList[0].totalleacture,
                totalClass: courseCardList[0].totalclass,
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
                isFavourite: isFavourite[2],
                fun: () {
                  if (isFavourite[2]) {
                    isFavourite[2] = !isFavourite[2];
                  } else {
                    isFavourite[2] = !isFavourite[2];
                  }
                  setState(() {});
                },
                imageUrl: courseCardList[0].image,
                subjectName: courseCardList[0].subject,
                totalLeacture: courseCardList[0].totalleacture,
                totalClass: courseCardList[0].totalclass,
                icon: Icons.favorite,
                context: context,
              ),
              commonCourseCard(
                isFavourite: isFavourite[3],
                fun: () {
                  if (isFavourite[3]) {
                    isFavourite[3] = !isFavourite[3];
                  } else {
                    isFavourite[3] = !isFavourite[3];
                  }
                  setState(() {});
                },
                imageUrl: courseCardList[0].image,
                subjectName: courseCardList[0].subject,
                totalLeacture: courseCardList[0].totalleacture,
                totalClass: courseCardList[0].totalclass,
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
                isFavourite: isFavourite[4],
                fun: () {
                  if (isFavourite[4]) {
                    isFavourite[4] = !isFavourite[4];
                  } else {
                    isFavourite[4] = !isFavourite[4];
                  }
                  setState(() {});
                },
                imageUrl: courseCardList[0].image,
                subjectName: courseCardList[0].subject,
                totalLeacture: courseCardList[0].totalleacture,
                totalClass: courseCardList[0].totalclass,
                icon: Icons.favorite,
                context: context,
              ),
              commonCourseCard(
                isFavourite: isFavourite[5],
                fun: () {
                  if (isFavourite[5]) {
                    isFavourite[5] = !isFavourite[5];
                  } else {
                    isFavourite[5] = !isFavourite[5];
                  }
                  setState(() {});
                },
                imageUrl: courseCardList[0].image,
                subjectName: courseCardList[0].subject,
                totalLeacture: courseCardList[0].totalleacture,
                totalClass: courseCardList[0].totalclass,
                icon: Icons.favorite,
                context: context,
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
