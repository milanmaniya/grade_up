import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_widget/common_value.dart';
import 'package:grade_up/extension/media_query_extension.dart';
import 'package:grade_up/utils/constraint_data.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

Widget commonPhoneField({
  required BuildContext context,
  required Function()? onTap,
}) =>
    Card(
      margin: const EdgeInsets.only(top: 10),
      elevation: 5,
      shadowColor: Colors.grey,
      child: Container(
        margin: const EdgeInsets.only(
          top: 5,
          right: 5,
        ),
        height: context.screenHeight * 0.22,
        width: context.screenWidth * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: ConstraintData.bgColor,
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IntlPhoneField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                initialCountryCode: 'IN',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  CommonValue.phNumberValue = value.number;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
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
                    "GET OTP",
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
