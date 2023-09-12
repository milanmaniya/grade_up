import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_widget/common_phone_field.dart';
import 'package:grade_up/common_widget/common_toast.dart';
import 'package:grade_up/extension/media_query_extension.dart';
import 'package:grade_up/screen/otp_text_field_screen.dart';
import 'package:grade_up/utils/constraint_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  resizeToAvoidBottomInset: false,
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
                onTap: () async {
                  await _auth.verifyPhoneNumber(
                    phoneNumber: _controller.text,
                    codeAutoRetrievalTimeout: (verificationId) {},
                    codeSent: (verificationId, forceResendingToken) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpTextFieldScreen(
                            verificationId: verificationId,
                          ),
                        ),
                      );
                    },
                    verificationFailed: (error) {
                      CommonToast().showMessage(message: error.toString());
                    },
                    verificationCompleted: (phoneAuthCredential) {
                      CommonToast().showMessage(
                          message: 'Verification complete successfully');
                    },
                    timeout: const Duration(seconds: 30),
                  );

                  log(_controller.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
