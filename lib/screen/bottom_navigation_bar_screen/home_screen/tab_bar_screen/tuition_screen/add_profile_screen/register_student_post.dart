import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_controller/student_post_controller/student_post_controller.dart';
import 'package:grade_up/common_model/common_student_post_model.dart';
import 'package:grade_up/common_widget/common_text_form_field.dart';
import 'package:grade_up/common_widget/common_toast.dart';
import 'package:grade_up/extension/media_query_extension.dart';
import 'package:grade_up/utils/constraint_data.dart';

class RegisterStudentPostScreen extends StatefulWidget {
  const RegisterStudentPostScreen({super.key});

  @override
  State<RegisterStudentPostScreen> createState() =>
      _RegisterStudentPostScreenState();
}

class _RegisterStudentPostScreenState extends State<RegisterStudentPostScreen> {
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
          'Register Student Post',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: StudentRegController.key,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: context.screenHeight * 0.35,
                width: context.screenWidth * 0.8,
                margin:
                    EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/welcome.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Student name is required'),
                ]),
                icon: Icons.person,
                nameOfField: "Student Name",
                textEditingController:
                    StudentRegController.regStudentControllerList[0],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Student name is required'),
                  EmailValidator(errorText: 'This Email is not valid format.'),
                ]),
                icon: Icons.email,
                nameOfField: "Class",
                textEditingController:
                    StudentRegController.regStudentControllerList[1],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Weekly days is required'),
                ]),
                icon: Icons.phone_android,
                nameOfField: "Weekly Days",
                textEditingController:
                    StudentRegController.regStudentControllerList[2],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Subject is required'),
                ]),
                icon: Icons.email,
                nameOfField: "Subject",
                textEditingController:
                    StudentRegController.regStudentControllerList[3],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'message is required'),
                ]),
                icon: Icons.email,
                nameOfField: "Message",
                textEditingController:
                    StudentRegController.regStudentControllerList[4],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Student location is required'),
                ]),
                icon: Icons.email,
                nameOfField: "Location",
                textEditingController:
                    StudentRegController.regStudentControllerList[5],
              ),
              GestureDetector(
                onTap: () {
                  if (StudentRegController.key.currentState!.validate()) {
                    String id =
                        DateTime.now().millisecondsSinceEpoch.toString();

                    final student = StudentPost(
                      image: 'assets/student_6.jpg',
                      subject:
                          StudentRegController.regStudentControllerList[3].text,
                      totalDays:
                          StudentRegController.regStudentControllerList[2].text,
                      className:
                          StudentRegController.regStudentControllerList[1].text,
                      location:
                          StudentRegController.regStudentControllerList[5].text,
                      studentName:
                          StudentRegController.regStudentControllerList[0].text,
                      message:
                          StudentRegController.regStudentControllerList[4].text,
                      id: id,
                    );

                    studentPostList.add(student);

                    FirebaseFirestore.instance
                        .collection('Student')
                        .doc(id)
                        .set({
                      "image": 'assets/student_6.jpg',
                      "subject":
                          StudentRegController.regStudentControllerList[3].text,
                      "totalDays":
                          StudentRegController.regStudentControllerList[2].text,
                      "className":
                          StudentRegController.regStudentControllerList[1].text,
                      "location":
                          StudentRegController.regStudentControllerList[5].text,
                      "studentName":
                          StudentRegController.regStudentControllerList[0].text,
                      "message":
                          StudentRegController.regStudentControllerList[4].text,
                      "id": id,
                    }).then((value) {
                      CommonToast().showMessage(
                          message: 'Student Post Added Successfully...');
                      Navigator.pop(context);
                    }).onError((error, stackTrace) {
                      CommonToast().showMessage(message: error.toString());
                    });

                    // StudentFirebaseApi.addStudent(student);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 15,
                    top: 5,
                  ),
                  height: context.screenHeight * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Register Student Post",
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
