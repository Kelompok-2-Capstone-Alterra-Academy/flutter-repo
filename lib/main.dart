import 'package:flutter/material.dart';
import 'package:staredu/views/screen/auth/forgot_password/main/forgot_password_screen.dart';
import 'package:staredu/views/screen/auth/login/login_screen.dart';
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
      title: 'StarEdu',
      debugShowCheckedModeBanner: false,
      // add primary color
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: ForgotPasswordScreen.routeName,
      routes: {
        SplashWelcomeScreen.routeName: (context) => const SplashWelcomeScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        ForgotPasswordScreen.routeName: (context) =>
            const ForgotPasswordScreen(),
      },
    );
  }
}
