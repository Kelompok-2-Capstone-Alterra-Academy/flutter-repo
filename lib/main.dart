import 'package:flutter/material.dart';
import 'package:staredu/views/screen/auth/forgot_password/main/forgot_password_screen.dart';
import 'package:staredu/views/screen/auth/forgot_password/otp_verification/otp_verification_screen.dart';
import 'package:staredu/views/screen/auth/forgot_password/reset_password/reset_password.dart';
import 'package:staredu/views/screen/auth/login/login_screen.dart';
import 'package:staredu/views/screen/auth/register/account_verification/account_verification.dart';
import 'package:staredu/views/screen/auth/register/main/register_screen.dart';
import 'package:staredu/views/screen/home/home_screen.dart';
import 'package:staredu/views/screen/home/home_view_model.dart';
import 'package:staredu/views/screen/splash_welcome/splash_welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeViewModel()),
    ],
    child: const StarEdu(),
  ));
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
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SplashWelcomeScreen.routeName: (context) => const SplashWelcomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        ForgotPasswordScreen.routeName: (context) =>
            const ForgotPasswordScreen(),
        OtpVerificationScreen.routeName: (context) =>
            const OtpVerificationScreen(),
        ResetPasswordScreen.routeName: (context) => const ResetPasswordScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        AccountVerification.routeName: (context) => const AccountVerification(),
      },
    );
  }
}
