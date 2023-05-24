import 'package:flutter/material.dart';
import 'package:staredu/views/screen/auth/login/login_screen.dart';
import 'package:staredu/views/screen/course/course_taken_list.dart';
import 'package:staredu/views/screen/course/module/detail/module_detail_video.dart';
import 'package:staredu/views/screen/course/module/module_ask_mentor.dart';
import 'package:staredu/views/screen/course/module/module_list.dart';
import 'package:staredu/views/screen/course/module/module_live_session.dart';
import 'package:staredu/views/screen/course/module/module_list_quiz.dart';
import 'package:staredu/views/screen/home/home_screen.dart';
import 'package:staredu/views/screen/splash_welcome/splash_welcome_screen.dart';

void main() {
  runApp(const StarEdu());
}

class StarEdu extends StatelessWidget {
  const StarEdu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent Car',
      debugShowCheckedModeBanner: false,
      // add primary color
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: CourseTakenListScreen.routeName,
      routes: {
        SplashWelcomeScreen.routeName: (context) => const SplashWelcomeScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        CourseTakenListScreen.routeName: (context) =>
            const CourseTakenListScreen(),
        ModuleListScreen.routeName: (context) => const ModuleListScreen(),
        AskMentorScreen.routeName: (context) => const AskMentorScreen(),
        LiveSessionScreen.routeName: (context) => const LiveSessionScreen(),
        ModuleListQuizScreen.routeName: (context) =>
            const ModuleListQuizScreen(),
        ModuleVideoScreen.routeName: (context) => const ModuleVideoScreen(),
      },
    );
  }
}
