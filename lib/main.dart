import 'package:flutter/material.dart';
import 'package:staredu/views/screen/auth/login/login_screen.dart';
import 'package:staredu/views/screen/home/home_screen.dart';
import 'package:staredu/views/screen/mentor/chat_mentor_screen.dart';
import 'package:staredu/views/screen/mentor/mentor_screen.dart';
import 'package:staredu/views/screen/sell_course/course_payment_screen.dart';
import 'package:staredu/views/screen/sell_course/sell_course_screen.dart';
import 'package:staredu/views/screen/splash_welcome/splash_welcome_screen.dart';

void main() {
  runApp(const StarEdu());
}

class StarEdu extends StatelessWidget {
  const StarEdu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SellCourseScreen(),
      title: 'Rent Car',
      // add primary color
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      // initialRoute: LoginScreen.routeName,
      // routes: {
      //   SplashWelcomeScreen.routeName: (context) => const SplashWelcomeScreen(),
      //   HomeScreen.routeName: (context) => const HomeScreen(),
      //   LoginScreen.routeName: (context) => const LoginScreen(),
      // },
    );
  }
}
