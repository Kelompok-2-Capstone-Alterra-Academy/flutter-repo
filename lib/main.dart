import 'package:flutter/material.dart';
import 'package:staredu/views/screen/auth/forgot_password/main/forgot_password_screen.dart';
import 'package:staredu/views/screen/auth/forgot_password/otp_verification/otp_verification_screen.dart';
import 'package:staredu/views/screen/auth/forgot_password/reset_password/reset_password.dart';
import 'package:staredu/views/screen/auth/login/login_screen.dart';
import 'package:staredu/views/screen/course/course_taken_list.dart';
import 'package:staredu/views/screen/course/module/module_ask_mentor.dart';
import 'package:staredu/views/screen/course/module/module_list.dart';
import 'package:staredu/views/screen/course/module/module_live_session.dart';
import 'package:staredu/views/screen/course/module/module_list_quiz.dart';
import 'package:staredu/views/screen/auth/register/account_verification/account_verification.dart';
import 'package:staredu/views/screen/auth/register/main/register_screen.dart';
import 'package:staredu/views/screen/home/home_screen.dart';
import 'package:staredu/views/screen/post_feed/post_feed_screen.dart';
import 'package:staredu/views/screen/course/module/module_detail_ppt.dart';
import 'package:staredu/views/screen/live_session/schedule_course_screen.dart';
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
      // home: SellCourseScreen(),
      title: 'Rent Car',
      // add primary color
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: ScheduleCourseScreen.routeName,
      routes: {
        SplashWelcomeScreen.routeName: (context) => const SplashWelcomeScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        PostFeedScreen.routeName: (context) => const PostFeedScreen(),
        CourseTakenListScreen.routeName: (context) =>
            const CourseTakenListScreen(),
        ModuleListScreen.routeName: (context) => const ModuleListScreen(),
        AskMentorScreen.routeName: (context) => const AskMentorScreen(),
        LiveSessionScreen.routeName: (context) => const LiveSessionScreen(),
        ModuleListQuizScreen.routeName: (context) =>
            const ModuleListQuizScreen(),
        ModulDetailPPTScreen.routeName: (context) =>
            const ModulDetailPPTScreen(),
        ForgotPasswordScreen.routeName: (context) =>
            const ForgotPasswordScreen(),
        OtpVerificationScreen.routeName: (context) =>
            const OtpVerificationScreen(),
        ResetPasswordScreen.routeName: (context) => const ResetPasswordScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        AccountVerification.routeName: (context) => const AccountVerification(),
        ScheduleCourseScreen.routeName: (context) =>
            const ScheduleCourseScreen(),
      },
    );
  }
}
