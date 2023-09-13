import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/extension/media_query_extension.dart';

commonAppBar({
  required BuildContext context,
  required IconData prefixIcon,
  required VoidCallback fun1,
  required VoidCallback fun2,
  required VoidCallback fun3,
  required String tagName,
  required IconData actionFirstIcon,
  required IconData actionSecondIcon,
}) =>
    PreferredSize(
      preferredSize: Size(double.infinity, context.screenHeight * 0.010),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            IconButton(
              onPressed: fun1,
              icon: CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                radius: 20,
                child: Icon(
                  prefixIcon,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              tagName,
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: fun2,
              icon: CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                radius: 20,
                child: Icon(
                  actionFirstIcon,
                  color: Colors.black,
                ),
              ),
            ),
            IconButton(
              onPressed: fun3,
              icon: CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                radius: 20,
                child: Icon(
                  actionSecondIcon,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );

commonSecondAppBar({
  required BuildContext context,
  required IconData prefixIcon,
  required VoidCallback fun1,
  required VoidCallback fun2,
  required String tagName,
  required IconData actionFirstIcon,
}) =>
    PreferredSize(
      preferredSize: Size(double.infinity, context.screenHeight * 0.010),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            IconButton(
              onPressed: fun1,
              icon: CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                radius: 20,
                child: Icon(
                  prefixIcon,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              tagName,
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: fun2,
              icon: CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                radius: 20,
                child: Icon(
                  actionFirstIcon,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
