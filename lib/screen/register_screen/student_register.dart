import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_widget/common_text_editing_controller.dart';
import 'package:grade_up/common_widget/common_text_form_field.dart';
import 'package:grade_up/extension/media_query_extension.dart';
import 'package:grade_up/firebase_api/firebase_api.dart';
import 'package:grade_up/utils/constraint_data.dart';

class StudentRegisterScreen extends StatefulWidget {
  const StudentRegisterScreen({super.key});

  @override
  State<StudentRegisterScreen> createState() => _StudentRegisterScreenState();
}

class _StudentRegisterScreenState extends State<StudentRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstraintData.bgColor,
      appBar: AppBar(
        backgroundColor: ConstraintData.bgAppBarColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(
          'Register',
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
          key: CommonRegController.key,
          child: Column(
            children: [
              Container(
                height: context.screenHeight * 0.35,
                width: context.screenWidth * 0.9,
                margin:
                    EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/hospitalregister.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              commonTextFormField(
                icon: Icons.person,
                nameOfField: "User Name",
                textEditingController: CommonRegController.regControllerList[0],
              ),
              commonTextFormField(
                icon: Icons.phone_android,
                nameOfField: "Mobile No.",
                textEditingController: CommonRegController.regControllerList[1],
              ),
              commonTextFormField(
                icon: Icons.email,
                nameOfField: "Email",
                textEditingController: CommonRegController.regControllerList[2],
              ),
              commonTextFormField(
                icon: Icons.home,
                nameOfField: "Age",
                textEditingController: CommonRegController.regControllerList[3],
              ),
              commonTextFormField(
                icon: Icons.home,
                nameOfField: "Address..",
                textEditingController: CommonRegController.regControllerList[4],
              ),
              commonTextFormField(
                icon: Icons.lock,
                nameOfField: "Password",
                textEditingController: CommonRegController.regControllerList[5],
                obscureText: true,
              ),
              commonTextFormField(
                icon: Icons.lock,
                nameOfField: "Conform Password",
                textEditingController: CommonRegController.regControllerList[6],
                obscureText: true,
              ),
              GestureDetector(
                onTap: () async {
                  await FirebaseApi.setUserData(
                    userName: CommonRegController.regControllerList[0].text,
                    mobNum: CommonRegController.regControllerList[1].text,
                    email: CommonRegController.regControllerList[2].text,
                    age: CommonRegController.regControllerList[3].text,
                    address: CommonRegController.regControllerList[4].text,
                    pass: CommonRegController.regControllerList[5].text,
                  ).then((value) {
                    CommonRegController.regControllerList.clear();
                    Navigator.pop(context);
                  });
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
                    "Register",
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
