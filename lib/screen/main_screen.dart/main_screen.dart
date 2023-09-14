import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/account_screen/account_screen.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/favourite_screen/favourite_screen.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/home_screen.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/message_screen/message_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screenList = [
    const HomeScreen(),
    const MessageScreen(),
    const FavouriteScreen(),
    const AccountScreen(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screenList[_selectedIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.blue,
        gapLocation: GapLocation.none,
        icons: const [Icons.home, Icons.message, Icons.favorite, Icons.people],
        activeIndex: _selectedIndex,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: (index) => setState(() => _selectedIndex = index),
        //other params
      ),
    );
  }
}
