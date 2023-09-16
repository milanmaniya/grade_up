import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grade_up/common_widget/common_toast.dart';
import 'package:grade_up/screen/sign_up_screen/otp_text_field_screen.dart';

class FirebaseApiAuth {
  void sendOtp(
      {required String phoneNumber, required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
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
        CommonToast()
            .showMessage(message: 'Verification complete successfully');
      },
      timeout: const Duration(seconds: 30),
    );
  }
}
