import 'package:flutter/material.dart';
import 'package:grade_up/common_model/common_card_model.dart';
import 'package:grade_up/common_widget/common_course_card.dart';
import 'package:grade_up/common_widget/common_course_tag.dart';
import 'package:grade_up/firebase_api/student_firebase_api/student_firebase_api.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/online_courses_screen/language_course_screen.dart/language.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/online_courses_screen/latest_courses_screen.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/online_courses_screen/provider_screen/isfavourite_provider.dart';
import 'package:provider/provider.dart';

class OnlineCourseScreen extends StatefulWidget {
  const OnlineCourseScreen({super.key});

  @override
  State<OnlineCourseScreen> createState() => _OnlineCourseScreenState();
}

class _OnlineCourseScreenState extends State<OnlineCourseScreen> {
  @override
  void initState() {
    StudentFirebaseApi.setStudentData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);

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
                cardFun: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LanguageCourseScreen(index: 0),
                    ),
                  );
                },
                isFavourite: provider.isExit(0),
                fun: () {
                  provider.toggleFavourite(0);
                },
                imageUrl: courseCardList[0].image,
                subjectName: courseCardList[0].subject,
                totalLeacture: courseCardList[0].totalleacture,
                icon: Icons.favorite,
                context: context,
              ),
              commonCourseCard(
                cardFun: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LanguageCourseScreen(index: 1),
                    ),
                  );
                },
                isFavourite: provider.isExit(1),
                fun: () {
                  provider.toggleFavourite(1);
                },
                imageUrl: courseCardList[1].image,
                subjectName: courseCardList[1].subject,
                totalLeacture: courseCardList[1].totalleacture,
                icon: Icons.favorite,
                context: context,
              ),
            ],
          ),
          commonCourseTag(
            tagName: 'Best Seller Courses',
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
                cardFun: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LanguageCourseScreen(index: 2),
                    ),
                  );
                },
                isFavourite: provider.isExit(2),
                fun: () {
                  provider.toggleFavourite(2);
                },
                imageUrl: courseCardList[2].image,
                subjectName: courseCardList[2].subject,
                totalLeacture: courseCardList[2].totalleacture,
                icon: Icons.favorite,
                context: context,
              ),
              commonCourseCard(
                cardFun: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LanguageCourseScreen(index: 3),
                    ),
                  );
                },
                isFavourite: provider.isExit(3),
                fun: () {
                  provider.toggleFavourite(3);
                },
                imageUrl: courseCardList[3].image,
                subjectName: courseCardList[3].subject,
                totalLeacture: courseCardList[3].totalleacture,
                icon: Icons.favorite,
                context: context,
              ),
            ],
          ),
          commonCourseTag(
            tagName: 'Most Popular Courses',
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
                cardFun: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LanguageCourseScreen(index: 4),
                    ),
                  );
                },
                isFavourite: provider.isExit(4),
                fun: () {
                  provider.toggleFavourite(4);
                },
                imageUrl: courseCardList[4].image,
                subjectName: courseCardList[4].subject,
                totalLeacture: courseCardList[4].totalleacture,
                icon: Icons.favorite,
                context: context,
              ),
              commonCourseCard(
                cardFun: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LanguageCourseScreen(index: 5),
                    ),
                  );
                },
                isFavourite: provider.isExit(5),
                fun: () {
                  provider.toggleFavourite(5);
                },
                imageUrl: courseCardList[5].image,
                subjectName: courseCardList[5].subject,
                totalLeacture: courseCardList[5].totalleacture,
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
