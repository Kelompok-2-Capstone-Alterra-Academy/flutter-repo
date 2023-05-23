import 'package:flutter/material.dart';
import 'package:staredu/views/screen/home/home_screen.dart';

class SplashWelcomeScreen extends StatefulWidget {
  const SplashWelcomeScreen({super.key});
  static const routeName = '/';

  @override
  State<SplashWelcomeScreen> createState() => _SplashWelcomeScreenState();
}

class _SplashWelcomeScreenState extends State<SplashWelcomeScreen> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: Image.asset('assets/images/logo_splash.jpg')),
            bottomNavigationBar: SizedBox(
                height: 150,
                child: Image.asset('assets/images/bottom_splash.jpg')))
        : const HomeScreen();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }
}
