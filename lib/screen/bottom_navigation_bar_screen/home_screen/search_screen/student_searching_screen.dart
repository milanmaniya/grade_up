import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_model/common_student_post_model.dart';
import 'package:grade_up/common_widget/common_student_post_card.dart';
import 'package:grade_up/utils/constraint_data.dart';
import 'package:lottie/lottie.dart';

class StudentSearchingScreen extends StatefulWidget {
  const StudentSearchingScreen({super.key});

  @override
  State<StudentSearchingScreen> createState() => _StudentSearchingScreenState();
}

class _StudentSearchingScreenState extends State<StudentSearchingScreen> {
  TextEditingController txtNameController = TextEditingController();

  List<StudentPost> updatedList = [];

  void searchData(String value) {
    setState(() {
      updatedList = studentPostList
          .where((element) =>
              element.studentName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    updatedList = studentPostList;
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
          'Search Teacher',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: txtNameController,
              decoration: InputDecoration(
                labelText: 'Search Here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) => searchData(value),
            ),
            const SizedBox(
              height: 20,
            ),
            updatedList.isNotEmpty
                ? Expanded(
                    child:  ListView.builder(
                      itemCount: updatedList.length,
                      itemBuilder: (context, index) => commonStudentPostCard(
                        message: updatedList[index].message,
                        className: updatedList[index].className,
                        totalDay: updatedList[index].totalDays,
                        subject: updatedList[index].subject,
                        imageUrl: updatedList[index].image,
                        studentName: updatedList[index].studentName,
                        location: updatedList[index].location,
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
      ),
    );
  }
}
