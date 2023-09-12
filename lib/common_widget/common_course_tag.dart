import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

commonCourseTag({
  required String tagName,
  required String buttonName,
  required VoidCallback fun,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            tagName,
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 20,
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
