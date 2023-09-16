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
              teacherName: commonTeacherCardList[0].teacherName,
              experience: commonTeacherCardList[0].experience,
              subject: commonTeacherCardList[0].subject,
              rate: commonTeacherCardList[0].rate,
              reviews: commonTeacherCardList[0].review,
              imageUrl: commonTeacherCardList[0].image,
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
              fun: () {},
            ),
            Card(
              elevation: 5,
              color: Colors.grey.shade100,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 260,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'I Need A Good Teacher',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        commonContainer(),
                        Text(
                          ':',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        commonContainer(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        commonContainer(),
                        Text(
                          ':',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        commonContainer(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        commonContainer(),
                        Text(
                          ':',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        commonContainer(),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 55,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Milan',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.black,
                                  size: 14,
                                ),
                                Text(
                                  'Surat',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  commonContainer() => Container(
        width: 100,
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          'Class',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
