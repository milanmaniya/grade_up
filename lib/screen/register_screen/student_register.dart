import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_controller/register_controller/common_text_editing_controller.dart';
import 'package:grade_up/common_widget/common_text_form_field.dart';
import 'package:grade_up/common_widget/common_toast.dart';
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
                  RequiredValidator(errorText: 'User Name is required'),
                ]),
                icon: Icons.person,
                nameOfField: "User Name",
                textEditingController: CommonRegController.regControllerList[0],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Student name is required'),
                  RangeValidator(
                      min: 10, max: 10, errorText: 'Range is not valid.'),
                ]),
                icon: Icons.phone_android,
                nameOfField: "Mobile No.",
                textEditingController: CommonRegController.regControllerList[1],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Student name is required'),
                  EmailValidator(errorText: 'This Email is not valid.'),
                ]),
                icon: Icons.email,
                nameOfField: "Email",
                textEditingController: CommonRegController.regControllerList[2],
              ),
              commonTextFormField(
                validator: MultiValidator(
                  [
                    RequiredValidator(errorText: 'Age is required'),
                  ],
                ),
                icon: Icons.calendar_month_rounded,
                nameOfField: "Age",
                textEditingController: CommonRegController.regControllerList[3],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Gender is required'),
                ]),
                icon: Icons.person_2_rounded,
                nameOfField: "Gender",
                textEditingController: CommonRegController.regControllerList[4],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Address is required'),
                ]),
                icon: Icons.home,
                nameOfField: "Address..",
                textEditingController: CommonRegController.regControllerList[5],
              ),
              commonTextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Student name is required'),
                ]),
                icon: Icons.lock,
                nameOfField: "Password",
                textEditingController: CommonRegController.regControllerList[6],
                obscureText: true,
              ),
              commonTextFormField(
                validator: (p0) =>
                    MatchValidator(errorText: 'password does not match')
                        .validateMatch(
                            CommonRegController.regControllerList[6].text,
                            CommonRegController.regControllerList[7].text),
                icon: Icons.lock,
                nameOfField: "Conform Password",
                textEditingController: CommonRegController.regControllerList[7],
                obscureText: true,
              ),
              GestureDetector(
                onTap: () async {
                  if (CommonRegController.key.currentState!.validate()) {
                    if (CommonRegController.regControllerList[6].text ==
                        CommonRegController.regControllerList[7].text) {
                      await FirebaseApi.setUserData(
                        userName: CommonRegController.regControllerList[0].text,
                        mobNum: CommonRegController.regControllerList[1].text,
                        email: CommonRegController.regControllerList[2].text,
                        age: CommonRegController.regControllerList[3].text,
                        gender: CommonRegController.regControllerList[4].text,
                        address: CommonRegController.regControllerList[5].text,
                        pass: CommonRegController.regControllerList[6].text,
                      ).then((value) {
                        CommonRegController.regControllerList.clear();
                        Navigator.pop(context);
                      });
                    } else {
                      CommonToast().showMessage(
                          message:
                              'Password and Conform password are different. Please enter the right password !');
                    }
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
