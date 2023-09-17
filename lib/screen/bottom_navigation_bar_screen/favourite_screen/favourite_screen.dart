import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_model/common_card_model.dart';
import 'package:grade_up/common_model/common_teacher_card_model.dart';
import 'package:grade_up/common_widget/common_course_card.dart';
import 'package:grade_up/common_widget/common_teacher_card.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/online_courses_screen/language_course_screen.dart/language.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/online_courses_screen/provider_screen/isfavourite_provider.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/tuition_screen/provider_screen/teacher_favourite_screen.dart';
import 'package:grade_up/utils/constraint_data.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<FavouriteProvider>(context);

    final studentIndexList = studentProvider.courseFavourite;

    final teacherProvider = Provider.of<TeacherFavouriteProvider>(context);
    final teacherIndexList = teacherProvider.teacherFavourite;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstraintData.bgAppBarColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(
          'Favourite',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
              child: Text(
                'Online Courses',
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Wrap(
                runSpacing: 10,
                spacing: 5,
                children: List.generate(
                  studentIndexList.length,
                  (index) => commonCourseCard(
                    cardFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LanguageCourseScreen(index: index),
                        ),
                      );
                    },
                    isFavourite: studentProvider.isExit(index),
                    fun: () {
                      studentProvider.toggleFavourite(index);
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
              child: Text(
                'Suggested Teacher',
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: teacherIndexList.length,
                itemBuilder: (context, index) => commonTeacherCard(
                  isFavourite: teacherProvider.isExit(index),
                  fun: () {
                    teacherProvider.toggleFavourite(index);
                  },
                  teacherName: commonTeacherCardList[index].teacherName,
                  experience: commonTeacherCardList[index].experience,
                  subject: commonTeacherCardList[index].subject,
                  rate: commonTeacherCardList[index].rate,
                  reviews: commonTeacherCardList[index].review,
                  imageUrl: commonTeacherCardList[index].image,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
