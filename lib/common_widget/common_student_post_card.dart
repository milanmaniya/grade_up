import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

commonStudentPostCard({
  required String message,
  required String className,
  required String totalDay,
  required String subject,
  required String imageUrl,
  required String studentName,
  required String location,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        elevation: 5,
        color: Colors.grey.shade100,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 260,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  commonContainer(value: 'Class'),
                  Text(
                    ':',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  commonContainer(value: className),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  commonContainer(value: 'Weekly'),
                  Text(
                    ':',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  commonContainer(value: totalDay),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  commonContainer(value: 'Subjects'),
                  Text(
                    ':',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  commonContainer(value: subject),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 55,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        image: AssetImage(imageUrl),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        studentName,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: Colors.black,
                            size: 14,
                          ),
                          Text(
                            location,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

commonContainer({
  required String value,
}) =>
    Container(
      width: 100,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
