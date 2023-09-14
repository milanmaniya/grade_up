import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

commonCourseCard({
  bool isFavourite = false,
  VoidCallback? fun,
  required String imageUrl,
  required String subjectName,
  required String totalLeacture,
  required String totalClass,
  required IconData icon,
  required BuildContext context,
}) =>
    Card(
      elevation: 5,
      child: SizedBox(
        height: 200,
        width: 175,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imageUrl,
              height: 123,
              width: 175,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subjectName,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: fun,
                    icon: CircleAvatar(
                      backgroundColor: isFavourite == true
                          ? Colors.red.shade100
                          : Colors.grey.shade100,
                      radius: 12,
                      child: Icon(
                        icon,
                        size: 12,
                        color: isFavourite == true
                            ? Colors.red.shade400
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 18,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    totalClass,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    totalLeacture,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
