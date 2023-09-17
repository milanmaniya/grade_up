import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_model/common_teacher_card_model.dart';
import 'package:grade_up/common_widget/common_teacher_card.dart';
import 'package:grade_up/utils/constraint_data.dart';
import 'package:lottie/lottie.dart';

class TeacherSearchScreen extends StatefulWidget {
  const TeacherSearchScreen({super.key});

  @override
  State<TeacherSearchScreen> createState() => _TeacherSearchScreenState();
}

class _TeacherSearchScreenState extends State<TeacherSearchScreen> {
  TextEditingController txtNameController = TextEditingController();

  List<TeacherCard> updatedList = [];

  void searchData(String value) {
    setState(() {
      updatedList = commonTeacherCardList
          .where((element) =>
              element.teacherName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    updatedList = commonTeacherCardList;
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
                    child: ListView.builder(
                      itemCount: updatedList.length,
                      itemBuilder: (context, index) => commonTeacherCard(
                        teacherName: updatedList[index].teacherName,
                        experience: updatedList[index].experience,
                        subject: updatedList[index].subject,
                        rate: updatedList[index].rate,
                        reviews: updatedList[index].review,
                        imageUrl: updatedList[index].image,
                      ),
                    ),
                  )
                : Center(
                    child: Lottie.asset(
                      'json/data_not_found.json',
                      repeat: true,
                      reverse: true,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
