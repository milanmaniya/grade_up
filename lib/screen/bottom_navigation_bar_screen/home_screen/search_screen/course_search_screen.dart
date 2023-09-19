import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_model/common_card_model.dart';
import 'package:grade_up/common_widget/common_course_card.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/online_courses_screen/language_course_screen.dart/language.dart';
import 'package:grade_up/utils/constraint_data.dart';
import 'package:lottie/lottie.dart';

class CourseSearchScreen extends StatefulWidget {
  const CourseSearchScreen({super.key});

  @override
  State<CourseSearchScreen> createState() => _CourseSearchScreenState();
}

class _CourseSearchScreenState extends State<CourseSearchScreen> {
  TextEditingController txtNameController = TextEditingController();

  List<CommonCardModel> updatedList = [];

  void searchData(String value) {
    setState(() {
      updatedList = courseCardList
          .where((element) =>
              element.subject.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    updatedList = courseCardList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          'Search Course',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: TextField(
              controller: txtNameController,
              decoration: InputDecoration(
                labelText: 'Search Here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) => searchData(value),
            ),
          ),
          updatedList.isNotEmpty
              ? Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Wrap(
                      runSpacing: 10,
                      spacing: 5,
                      children: List.generate(
                        updatedList.length,
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
                          imageUrl: updatedList[index].image,
                          subjectName: updatedList[index].subject,
                          totalLeacture: updatedList[index].totalleacture,
                          icon: Icons.favorite,
                          context: context,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: 380,
                  child: Align(
                    alignment: Alignment.center,
                    child: Lottie.asset(
                      'json/data_not_found.json',
                      repeat: true,
                      reverse: true,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
