import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_widget/common_course_tag.dart';

class TuitionScreen extends StatefulWidget {
  const TuitionScreen({super.key});

  @override
  State<TuitionScreen> createState() => _TuitionScreenState();
}

class _TuitionScreenState extends State<TuitionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                color: Colors.cyan.shade100,
                elevation: 4,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: CircleAvatar(
                          backgroundColor: Colors.grey.shade100,
                          radius: 20,
                          child: Icon(
                            Icons.add,
                            color: Colors.blue.shade400,
                          ),
                        ),
                      ),
                      Text(
                        'Register As\n Teacher',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.brown.shade50,
                elevation: 5,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: CircleAvatar(
                          backgroundColor: Colors.grey.shade100,
                          radius: 20,
                          child: const Icon(
                            Icons.add,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      Text(
                        'Student \n Post',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          commonCourseTag(
            tagName: 'Suggested Teacher',
            buttonName: 'See More',
            fun: () {},
          ),
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
                      image: const DecorationImage(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/prof_digital_marketing.jpg',
                        ),
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
                            'Minhazul Abedin',
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
                        'Digital Marketing',
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
                        '2 Years Experience',
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
                            ' 4.0 (Reviews)',
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
          ),
        ],
      ),
    );
  }
}
