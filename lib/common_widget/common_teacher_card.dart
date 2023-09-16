import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

commonTeacherCard({
  required String teacherName,
  required String experience,
  required String subject,
  required String rate,
  required String reviews,
  required String imageUrl,
}) =>
    Card(
      color: Colors.grey.shade100,
      elevation: 5,
      child: Container(
        height: 130,
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 110,
              decoration: BoxDecoration(
                image: DecorationImage(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  image: AssetImage(imageUrl),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      teacherName,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        backgroundColor: Colors.grey.shade100,
                        radius: 12,
                        child: const Icon(
                          Icons.favorite,
                          size: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  subject,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '$experience Years Experience',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade800,
                      size: 20,
                    ),
                    Text(
                      ' $rate ( $reviews Reviews)',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
