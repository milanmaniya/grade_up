import 'package:flutter/material.dart';
import 'package:grade_up/common_model/common_card_model.dart';
import 'package:grade_up/common_widget/common_app_bar.dart';
import 'package:grade_up/common_widget/common_course_card.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/online_courses_screen/language_course_screen.dart/language.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/tuition_screen/provider_screen/isfavourite_provider.dart';
import 'package:grade_up/utils/constraint_data.dart';
import 'package:provider/provider.dart';

class LatestCourseScreen extends StatefulWidget {
  const LatestCourseScreen({super.key});

  @override
  State<LatestCourseScreen> createState() => _LatestCourseScreenState();
}

class _LatestCourseScreenState extends State<LatestCourseScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);

    return Scaffold(
      backgroundColor: ConstraintData.bgColor,
      appBar: AppBar(
        bottom: commonAppBar(
          context: context,
          prefixIcon: Icons.arrow_back,
          tagName: 'Latest Courses',
          fun1: () {
            Navigator.pop(context);
          },
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
              cardFun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LanguageCourseScreen(index: index),
                  ),
                );
              },
              isFavourite: provider.isExit(index),
              fun: () {
                provider.toggleFavourite(index);
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
