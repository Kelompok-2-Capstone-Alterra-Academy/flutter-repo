import 'package:flutter/material.dart';
import 'package:staredu/utils/animation/slide_animation.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/views/screen/home/home_screen.dart';

class SplashWelcomeScreen extends StatefulWidget {
  const SplashWelcomeScreen({super.key});
  static const routeName = '/splash';

  @override
  State<SplashWelcomeScreen> createState() => _SplashWelcomeScreenState();
}

class _SplashWelcomeScreenState extends State<SplashWelcomeScreen> {
  bool? isLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Image.asset('assets/images/logo_splash.jpg')),
        bottomNavigationBar: SizedBox(
            height: 150,
            child: Image.asset('assets/images/bottom_splash.jpg')));
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    PreferencesUtils preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    Future.delayed(const Duration(seconds: 5), () {
      // setState(() {
      //   isLogin = preferencesUtils.getPreferencesBool('isLogin');
      // });
      // if (isLogin == null) {
      //   Navigator.pushAndRemoveUntil(
      //     context,
      //     FadeAnimation(page: const LoginScreen()),
      //     (Route<dynamic> route) => false,
      //   );
      // } else {
      Navigator.pushAndRemoveUntil(
        context,
        SlideAnimation(page: const HomeScreen()),
        (Route<dynamic> route) => false,
      );
      // }
    });
  }
}
