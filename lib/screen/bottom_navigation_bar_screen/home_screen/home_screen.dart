import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_widget/common_app_bar.dart';
import 'package:grade_up/extension/media_query_extension.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/notification_screen/notification_screen.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/search_screen/course_search_screen.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/search_screen/student_searching_screen.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/search_screen/teacher_searching_screen.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/online_courses_screen/online_course_screen.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/tuition_screen/tuition_screen.dart';
import 'package:grade_up/utils/constraint_data.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ConstraintData.bgColor,
      appBar: AppBar(
        bottom: commonAppBar(
          context: context,
          prefixIcon: Icons.menu_open_rounded,
          fun1: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationScreen(),
              ),
            );
          },
          fun3: () {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationScreen(),
              ),
            );
          },
          fun2: () {
            bottomSheet(context);
          },
          tagName: 'Menu',
          actionFirstIcon: Icons.search,
          actionSecondIcon: Icons.notifications,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              height: 50,
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                controller: _tabController,
                indicator: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                tabs: const [
                  Tab(
                    text: 'Tuition',
                  ),
                  Tab(
                    text: 'Online Courses',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  TuitionScreen(),
                  OnlineCourseScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
      elevation: 5,
      backgroundColor: Colors.grey.shade300,
      isScrollControlled: true,
      isDismissible: true,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      context: context,
      builder: (context) => SizedBox(
        height: 450,
        width: context.screenWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Lottie.asset(
                'json/search_screen.json',
                height: 230,
                repeat: true,
                reverse: true,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.brown.shade50),
                  minimumSize: MaterialStateProperty.all(
                    Size(context.screenWidth, 50),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeacherSearchScreen(),
                    ),
                  );
                },
                child: Text(
                  'Search For Teacher',
                  style: GoogleFonts.lato(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.brown.shade50),
                  minimumSize: MaterialStateProperty.all(
                    Size(context.screenWidth, 50),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentSearchingScreen(),
                    ),
                  );
                },
                child: Text(
                  'Search For Student',
                  style: GoogleFonts.lato(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.brown.shade50),
                  minimumSize: MaterialStateProperty.all(
                    Size(context.screenWidth, 50),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CourseSearchScreen(),
                    ),
                  );
                },
                child: Text(
                  'Search For Courses',
                  style: GoogleFonts.lato(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
