import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

commonCourseTag({
  required String tagName,
  required String buttonName,
  required VoidCallback fun,
}) =>
    Row(
      children: [
        Text(
          tagName,
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: fun,
          child: Text(
            buttonName,
            style: GoogleFonts.lato(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
