import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/extension/media_query_extension.dart';

commonCourseCard({
  required String subjectName,
  required String totalClass,
  required String totalLeacture,
  required IconData icon,
  required VoidCallback fun,
  required BuildContext context,
  required String imageUrl,
}) =>
    Card(
      elevation: 10,
      child: Container(
        color: Colors.grey.shade100,
        height: context.screenHeight * 0.23,
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              height: 100,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  subjectName,
                  style: GoogleFonts.lato(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: fun,
                  icon: CircleAvatar(
                    backgroundColor: Colors.grey.shade100,
                    radius: 12,
                    child: Icon(
                      icon,
                      size: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  totalClass,
                  style: GoogleFonts.lato(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  totalLeacture,
                  style: GoogleFonts.lato(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
