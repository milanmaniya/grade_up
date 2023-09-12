import 'package:flutter/material.dart';
import 'package:grade_up/common_widget/common_app_bar.dart';
import 'package:grade_up/screen/tab_bar_screen/online_courses_screen/online_course_screen.dart';
import 'package:grade_up/screen/tab_bar_screen/tuition_screen/tuition_screen.dart';
import 'package:grade_up/utils/constraint_data.dart';

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
      backgroundColor: ConstraintData.bgColor,
      appBar: AppBar(
        bottom: commonAppBar(
          context: context,
          prefixIcon: Icons.menu_open_rounded,
          fun1: () {},
          fun2: () {},
          fun3: () {},
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
}