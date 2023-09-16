import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_model/common_card_model.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/online_courses_screen/language_course_screen.dart/leacture_screen/youtube_video_screen.dart';
import 'package:grade_up/utils/constraint_data.dart';

class LeactureScreen extends StatefulWidget {
  const LeactureScreen({super.key,required this.index});

  final int? index;

  @override
  State<LeactureScreen> createState() => _LeactureScreenState();
}

class _LeactureScreenState extends State<LeactureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstraintData.bgAppBarColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(
          ' Leactures',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: ListView.builder(
          itemCount: courseCardList[widget.index!].videoPlayerList.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YoutubePlayerScreen(
                    courseIndex: widget.index,
                    videoIndex: index,
                  ),
                ),
              );
            },
            title: Text('Leacture: $index'),
          ),
        ),
      ),
    );
  }
}
