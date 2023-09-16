import 'package:flutter/material.dart';
import 'package:grade_up/common_model/common_teacher_card_model.dart';
import 'package:grade_up/common_widget/common_app_bar.dart';
import 'package:grade_up/common_widget/common_teacher_card.dart';

class AllTeacherScreen extends StatefulWidget {
  const AllTeacherScreen({super.key});

  @override
  State<AllTeacherScreen> createState() => _AllTeacherScreenState();
}

class _AllTeacherScreenState extends State<AllTeacherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: commonAppBar(
          context: context,
          prefixIcon: Icons.arrow_back,
          tagName: 'Suggested Teachers',
          actionSecondIcon: Icons.notifications,
        ),
      ),
      body: ListView.builder(
        itemCount: commonTeacherCardList.length,
        itemBuilder: (context, index) => commonTeacherCard(
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
