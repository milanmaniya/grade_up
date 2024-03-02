import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grade_up/google%20e%20books%20api/screens/basic.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/online_courses_screen/provider_screen/isfavourite_provider.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/tuition_screen/provider_screen/teacher_favourite_screen.dart';
import 'package:grade_up/screen/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavouriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TeacherFavouriteProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const BasicBookScreen(),
      ),
    );
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (context) => FavouriteProvider(),
    //     ),
    //     ChangeNotifierProvider(
    //       create: (context) => TeacherFavouriteProvider(),
    //     ),
    //   ],
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    //       useMaterial3: true,
    //     ),
    //     home: const SplashScreenPage(),
    //   ),
    // );
  }
}
