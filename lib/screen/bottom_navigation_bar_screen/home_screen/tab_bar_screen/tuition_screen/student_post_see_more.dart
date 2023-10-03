import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_model/common_student_post_model.dart';
import 'package:grade_up/common_widget/common_student_post_card.dart';
import 'package:grade_up/utils/constraint_data.dart';

class StudentPostSeeMore extends StatefulWidget {
  const StudentPostSeeMore({super.key});

  @override
  State<StudentPostSeeMore> createState() => _StudentPostSeeMoreState();
}

class _StudentPostSeeMoreState extends State<StudentPostSeeMore> {
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
          'Suggested Student Post',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        itemCount: studentPostList.length,
        itemBuilder: (context, index) => commonStudentPostCard(
          message: studentPostList[index].message,
          className: studentPostList[index].className,
          totalDay: studentPostList[index].totalDays,
          subject: studentPostList[index].subject,
          imageUrl: studentPostList[index].image,
          studentName: studentPostList[index].studentName,
          location: studentPostList[index].location,
        ),
      ),
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('Student').snapshots(),
      //   builder: (context, snapshot) => ListView.builder(
      //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      //     itemCount: studentPostList.length,
      //     itemBuilder: (context, index) => commonStudentPostCard(
      //       message: snapshot.data!.docs[index]['message'].toString(),
      //       className: snapshot.data!.docs[index]['className'],
      //       totalDay: snapshot.data!.docs[index]['totalDays'],
      //       subject: snapshot.data!.docs[index]['subject'],
      //       imageUrl: snapshot.data!.docs[index]['image'],
      //       studentName:snapshot.data!.docs[index]['studentName'] ,
      //       location: snapshot.data!.docs[index]['location'],
      //     ),
      //   ),
      // ),
    );
  }
}
