import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_model/common_student_post_model.dart';
import 'package:grade_up/common_model/common_teacher_card_model.dart';
import 'package:grade_up/common_widget/common_course_tag.dart';
import 'package:grade_up/common_widget/common_student_post_card.dart';
import 'package:grade_up/common_widget/common_teacher_card.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/tuition_screen/add_profile_screen/register_student_post.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/tuition_screen/add_profile_screen/register_teacher_screen.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/tuition_screen/provider_screen/teacher_favourite_screen.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/tuition_screen/student_post_see_more.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/tuition_screen/teacher_see_more_screen.dart';
import 'package:provider/provider.dart';

class TuitionScreen extends StatefulWidget {
  const TuitionScreen({super.key});

  @override
  State<TuitionScreen> createState() => _TuitionScreenState();
}

class _TuitionScreenState extends State<TuitionScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TeacherFavouriteProvider>(context);

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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RegisterTeacherScreen(),
                              ),
                            );
                          },
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RegisterStudentPostScreen(),
                              ),
                            );
                          },
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
              fun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllTeacherScreen(),
                  ),
                );
              },
            ),
            commonTeacherCard(
              isFavourite: provider.isExit(0),
              fun: () {
                provider.toggleFavourite(0);
              },
              teacherName: commonTeacherCardList[0].teacherName,
              experience: commonTeacherCardList[0].experience,
              subject: commonTeacherCardList[0].subject,
              rate: commonTeacherCardList[0].rate,
              reviews: commonTeacherCardList[0].review,
              imageUrl: commonTeacherCardList[0].image,
            ),
            commonTeacherCard(
              isFavourite: provider.isExit(1),
              fun: () {
                provider.toggleFavourite(1);
              },
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
                    builder: (context) => const StudentPostSeeMore(),
                  ),
                );
              },
            ),
            commonStudentPostCard(
              message: studentPostList[0].message,
              className: studentPostList[0].className,
              totalDay: studentPostList[0].totalDays,
              subject: studentPostList[0].subject,
              imageUrl: studentPostList[0].image,
              studentName: studentPostList[0].studentName,
              location: studentPostList[0].location,
            ),
            commonStudentPostCard(
              message: studentPostList[1].message,
              className: studentPostList[1].className,
              totalDay: studentPostList[1].totalDays,
              subject: studentPostList[1].subject,
              imageUrl: studentPostList[1].image,
              studentName: studentPostList[1].studentName,
              location: studentPostList[1].location,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
