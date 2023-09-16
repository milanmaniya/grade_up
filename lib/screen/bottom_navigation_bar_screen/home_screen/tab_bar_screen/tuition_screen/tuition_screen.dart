import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_model/common_teacher_card_model.dart';
import 'package:grade_up/common_widget/common_course_tag.dart';
import 'package:grade_up/common_widget/common_teacher_card.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/tuition_screen/teacher_see_more_screen.dart';

class TuitionScreen extends StatefulWidget {
  const TuitionScreen({super.key});

  @override
  State<TuitionScreen> createState() => _TuitionScreenState();
}

class _TuitionScreenState extends State<TuitionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  color: Colors.cyan.shade100,
                  elevation: 4,
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: CircleAvatar(
                            backgroundColor: Colors.grey.shade100,
                            radius: 20,
                            child: Icon(
                              Icons.add,
                              color: Colors.blue.shade400,
                            ),
                          ),
                        ),
                        Text(
                          'Register As\n Teacher',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.brown.shade50,
                  elevation: 5,
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: CircleAvatar(
                            backgroundColor: Colors.grey.shade100,
                            radius: 20,
                            child: const Icon(
                              Icons.add,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        Text(
                          'Student \n Post',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            commonCourseTag(
              tagName: 'Suggested Teacher',
              buttonName: 'See More',
              fun: () {},
            ),
            commonTeacherCard(
              teacherName: commonTeacherCardList[0].teacherName,
              experience: commonTeacherCardList[0].experience,
              subject: commonTeacherCardList[0].subject,
              rate: commonTeacherCardList[0].rate,
              reviews: commonTeacherCardList[0].review,
              imageUrl: commonTeacherCardList[0].image,
            ),
            const SizedBox(
              height: 10,
            ),
            commonTeacherCard(
              teacherName: commonTeacherCardList[1].teacherName,
              experience: commonTeacherCardList[1].experience,
              subject: commonTeacherCardList[1].subject,
              rate: commonTeacherCardList[1].rate,
              reviews: commonTeacherCardList[1].review,
              imageUrl: commonTeacherCardList[1].image,
            ),
            commonCourseTag(
              tagName: 'Suggested Student Post',
              buttonName: 'See More',
              fun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllTeacherScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
