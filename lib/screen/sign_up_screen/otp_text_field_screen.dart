import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_widget/common_value.dart';
import 'package:grade_up/extension/media_query_extension.dart';
import 'package:grade_up/screen/home_screen/home_screen.dart';
import 'package:grade_up/utils/constraint_data.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpTextFieldScreen extends StatefulWidget {
  const OtpTextFieldScreen({super.key, required this.verificationId});

  final String verificationId;

  @override
  State<OtpTextFieldScreen> createState() => _OtpTextFieldScreenState();
}

class _OtpTextFieldScreenState extends State<OtpTextFieldScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstraintData.bgColor,
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
                    image: AssetImage(
                      "assets/otp.jpg",
                    ),
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
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.010,
              ),
              Text(
                ConstraintData.otpSend,
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
              OTPTextField(
                margin: const EdgeInsets.symmetric(vertical: 15),
                controller: CommonValue.otpController,
                length: 6,
                width: context.screenWidth * 0.95,
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
                style: const TextStyle(fontSize: 17),
                onChanged: (value) {},
                onCompleted: (pin) {
                  CommonValue.otpPinValue = pin;
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ConstraintData.otpNotRecieve,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      ConstraintData.otpResend,
                      style: GoogleFonts.lato(
                        color: Colors.redAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(7),
                  minimumSize: MaterialStateProperty.all(
                    Size(
                      context.screenWidth * 0.9,
                      context.screenHeight * 0.060,
                    ),
                  ),
                ),
                onPressed: () {
                  log(CommonValue.otpPinValue);

                  AuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: CommonValue.otpPinValue
                  );
                  _auth.signInWithCredential(credential).then(
                        (value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        ),
                      );
                },
                child: Text(
                  "Verify",
                  style: GoogleFonts.lato(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
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
