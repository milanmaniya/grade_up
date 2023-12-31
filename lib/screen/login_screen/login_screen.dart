import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_widget/common_phone_field.dart';
import 'package:grade_up/extension/media_query_extension.dart';
import 'package:grade_up/firebase_api/firebase_api_auth.dart';
import 'package:grade_up/screen/register_screen/student_register.dart';
import 'package:grade_up/utils/constraint_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: context.screenHeight * 0.40,
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
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Text(
                ConstraintData.otpVerification,
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Text(
                ConstraintData.otpVeriInfo,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              commonPhoneField(
                controller: _controller,
                context: context,
                onTap: () {
                  FirebaseApiAuth()
                      .sendOtp(phoneNumber: _controller.text, context: context);
                  log(_controller.text);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ConstraintData.notHaveAccount,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StudentRegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      ConstraintData.register,
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
