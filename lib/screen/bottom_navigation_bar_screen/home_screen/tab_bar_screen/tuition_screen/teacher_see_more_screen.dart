import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_model/common_teacher_card_model.dart';
import 'package:grade_up/common_widget/common_teacher_card.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/tuition_screen/provider_screen/teacher_favourite_screen.dart';
import 'package:grade_up/utils/constraint_data.dart';
import 'package:provider/provider.dart';

class AllTeacherScreen extends StatefulWidget {
  const AllTeacherScreen({super.key});

  @override
  State<AllTeacherScreen> createState() => _AllTeacherScreenState();
}

class _AllTeacherScreenState extends State<AllTeacherScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TeacherFavouriteProvider>(context);
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
          'Suggested Teacher',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: commonTeacherCardList.length,
        itemBuilder: (context, index) => commonTeacherCard(
          isFavourite: provider.isExit(index),
          fun: () {
            provider.toggleFavourite(index);
          },
          teacherName: commonTeacherCardList[index].teacherName,
          experience: commonTeacherCardList[index].experience,
          subject: commonTeacherCardList[index].subject,
          rate: commonTeacherCardList[index].rate,
          reviews: commonTeacherCardList[index].review,
          imageUrl: commonTeacherCardList[index].image,
        ),
      ),
    );
  }
}
