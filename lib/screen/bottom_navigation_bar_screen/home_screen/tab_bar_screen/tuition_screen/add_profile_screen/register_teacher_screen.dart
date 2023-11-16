import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_model/common_teacher_card_model.dart';
import 'package:grade_up/common_controller/teacher_post_controller/common_teacher_register.dart';
import 'package:grade_up/common_widget/common_text_form_field.dart';
import 'package:grade_up/common_widget/common_toast.dart';
import 'package:grade_up/extension/media_query_extension.dart';
import 'package:grade_up/utils/constraint_data.dart';

class RegisterTeacherScreen extends StatefulWidget {
  const RegisterTeacherScreen({super.key});

  @override
  State<RegisterTeacherScreen> createState() => _RegisterTeacherScreenState();
}

class _RegisterTeacherScreenState extends State<RegisterTeacherScreen> {
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
          'Register Teacher',
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
          key: TeacherRegController.key,
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
                  RequiredValidator(errorText: 'Teacher name is required'),
                ]),
                icon: Icons.person,
                nameOfField: "Teacher Name",
                textEditingController:
                    TeacherRegController.regTeacherControllerList[0],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Student name is required'),
                  RangeValidator(
                      min: 10, max: 10, errorText: 'Range is not valid.'),
                ]),
                icon: Icons.email,
                nameOfField: "Phone Number",
                textEditingController:
                    TeacherRegController.regTeacherControllerList[1],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  EmailValidator(
                      errorText: 'This Emaail is not aa valid format.'),
                  RequiredValidator(errorText: 'Student name is required'),
                ]),
                icon: Icons.phone_android,
                nameOfField: "Email Id",
                textEditingController:
                    TeacherRegController.regTeacherControllerList[2],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Subject is required'),
                ]),
                icon: Icons.email,
                nameOfField: "Subject",
                textEditingController:
                    TeacherRegController.regTeacherControllerList[3],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Age is required'),
                ]),
                icon: Icons.email,
                nameOfField: "Age",
                textEditingController:
                    TeacherRegController.regTeacherControllerList[4],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(
                      errorText: 'Teacher Experience is required'),
                ]),
                icon: Icons.email,
                nameOfField: "Experience",
                textEditingController:
                    TeacherRegController.regTeacherControllerList[5],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Gender is required'),
                ]),
                icon: Icons.email,
                nameOfField: "Gender",
                textEditingController:
                    TeacherRegController.regTeacherControllerList[6],
              ),
              GestureDetector(
                onTap: () {
                  if (TeacherRegController.key.currentState!.validate()) {
                    String id =
                        DateTime.now().microsecondsSinceEpoch.toString();

                    final teacher = TeacherCard(
                      image: 'assets/prof_cplus.jpg',
                      subject:
                          TeacherRegController.regTeacherControllerList[1].text,
                      teacherName:
                          TeacherRegController.regTeacherControllerList[0].text,
                      experience:
                          TeacherRegController.regTeacherControllerList[5].text,
                      rate: '3.5',
                      review: ' 7 Reviews ',
                      id: id,
                    );

                    commonTeacherCardList.add(teacher);

                    FirebaseFirestore.instance
                        .collection('Student')
                        .doc(id)
                        .set({
                      "image": 'assets/prof_cplus.jpg',
                      "subject":
                          TeacherRegController.regTeacherControllerList[1].text,
                      "teacherName":
                          TeacherRegController.regTeacherControllerList[0].text,
                      "experience":
                          TeacherRegController.regTeacherControllerList[5].text,
                      "rate": '3.5',
                      "review": ' 7 Reviews ',
                      "id": id,
                    }).then((value) {
                      CommonToast().showMessage(
                          message: 'Teacher Profile Added Successfully...');
                      Navigator.pop(context);
                    }).onError((error, stackTrace) {
                      CommonToast().showMessage(message: error.toString());
                    });

                    // TeacherFirebaseApi.setTeacherData();
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
                    "Register Teacher",
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
